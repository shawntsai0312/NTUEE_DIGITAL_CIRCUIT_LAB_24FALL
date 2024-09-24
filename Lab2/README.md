# Lab2 Guideline

The roadmap of this lab:

1. Create project (same as lab1)
2. Implement the RSA256 core
3. Implement a Avalon master to control RS-232 and wrap your core
4. Build Qsys system
5. Compile and program (same as lab1)

## Implement the RSA256 Core
Before starting the introduction, I want to share an good concept
that I've learned when I interned at a hardware company.

> When you design an architecture, you design the dataflow first.
> Write Verilog only after you have make sure of all dataflow.

For example if we want to design a module for outputing all even numbers less than
a certain number, then we can design two modules:

module A: given n, counting from 0 to n-1

{5} -> {0, 1, 2, 3, 4}

module B: given a number, output if it is even.

{1, 4, 1, 5, 10, 0} -> {4, 10, 0}

Then the desired module is obtained by connecting A and B.

We intdoruce two very common but simple protocol dataflow.
The one wire protocol is quite simple: if "sender" set the val (valid signal)
to high, then the "sender" has prepared a valid data at that cycle.

    output val         ----> input val
    output dat1        ----> input dat1
    output [10:0] dat2 ----> input [10:0] dat2

Often the module cannot handle data at the moment, so another signal rdy (ready)
is used to stop the data transfer, which can be called as the two wire protocol.

    output val         ----> input  val
    input  rdy         <---- output rdy
    output dat1        ----> input  dat1
    output [10:0] dat2 ----> input [10:0] dat2

val (valid signal) means that "sender" want to send the data, and the sender must hold the data you want to send.
rdy (ready signal) means that "receiver" can accept the data.
If val is 0, then there is no effect whether rdy is 0 or 1 (aka don't care).
If val is 1, when "receiver" set rdy to 1 in this cycle, the "sender" may start the next transfer or
change the data in the next cycle.
On the other hand, you may assume the data hold if "receiver" set rdy to 0.

So now it's easy to understand the design for core module.

{a, e, n} -> core module -> {pow(a, e) mod n}

That's all, your mission is to implement a module that accept {a, e, n} and
output pow(a, e) mod n, conforming to the two wire protocol.
We also prepared a testbench for you (see appendix).

## Implement a Avalon Master to Control RS-232 and Wrap Your Core

The RS-232 module mainly has 2 functionalities.

1. Read a byte from computer
2. Write a byte from computer

Basically, your module (Avalon master) will work like this.

1. Receive 32 bytes from computer (n)
2. Receive 32 bytes from computer (e)
3. Receive 32 bytes from computer (a)
4. Compute
5. Send 31 bytes to computer (pow(a, e) mod n)
6. Go to 3

And you have to use Avalon protocol to actually read/write a byte from the RS-232 Qsys module.
The "read a byte" is done by the following sequence:

1. Read RX\_READY bit of the STATUS word
2. If it's 1, go to 3, else go to 1.
3. Read the lower byte of the RX word

Simliarly, the "write a byte" is done by the following sequence:

1. Read TX\_READY bit of the STATUS word
2. If it's 1, go to 3, else go to 1.
3. Write the lower byte of the TX word

If you understand the two wire protocol in the previous part,
then the Avalon protocol is just a variant and combination of the two wire protocol.
It's your task to read the Avalon protocol and RS-232 document for more details (available on NAS).
We also prepared a testbench for you (see appendix).

## Build Qsys system
Please follow the powerpoint.

# Requirements
The requirements are:

* Connect your PC and FPGA with RS-232 cable.
* Run the Connect your PC and FPGA with RS-232 cable,
  execute pc\_sw/rs232.py to decrypt enc.bin with key.bin (There will be hidden data).
* You have to install Python and serial library. Try to install that by yourself.

## Bonus

* Can you compute longer RSA?
* Design a better protocol so you don't have to reset every time.

# Appendix
## File Structure

* src/DE2\_115
	* All files related to the FPGA
* src/pc_python/
	* Python program for pc during RSA256 decryption
* src/tb_verilog/
	* Verilog testbench for RSA256 core and wrapper 
* src/Rsa256Core.sv
    * Implement RSA256 decryption algorithm here.
* src/Rsa256Wrapper.sv
    * Implement controller for RS232 protocol
    * Including reading check bits and read/write data. 

## Run pc_python program on pc

* Recommended python version: Python2
* Usage
    * Windows: install python compiler
    * Mac/Linux: run with command line
* Command
```
    python rs232.py [COM? | /dev/ttyS0 | /dev/ttyUSB0]
```

## Testbench Usage

* Test Rsa256Core
```
    vcs <tb.sv> <Rsa256Core.sv> -full64 -R -debug_access+all -sverilog +access+rw
```
* Test Rsa256Wrapper 
```
    vcs <test_wrapper.sv> <PipelineCtrl.v> <PipelineTb.v> \ 
    <Rsa256Wrapper.sv> <Rsa256Core.sv> -full64 -R -debug_access+all -sverilog +access+rw
```
**NOTICE:** Please follow the exact argument order, wrong order may lead to error. 

## Python Reference Implementation

This can be used to check all temporary results and generate test cases.
Note that the size of plain text must be 31n.

Encode:
```
    python2 rsa.py e < plain.txt > cipher.bin
```

Decode:
```
    python2 rsa.py d < cipher.bin > plain.txt
```

