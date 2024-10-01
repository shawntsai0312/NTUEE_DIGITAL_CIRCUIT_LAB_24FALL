# Lab 2 RSA256 解密機

### Before Running

```shell
cd Lab2/src/tb_verilog
source tool.sh
```

## Part 1: Core

### How To Run Core Simulation

1. run the following commands in the terminal
    ```shell
    cd Lab2/src/tb_verilog
    source core.sh
    nWave &
    ```

2. open nWave and open the file `src/tb_verilog/lab2.fsdb`
3. select desired signals

### Algorithm

below algorithm is based on python, for pseudocode, please checkout [doc](./doc/Lab2_lecture.pdf) P.12 - 15

```python
def modulo_product(N, a):
    """
    Function to perform modular multiplication: (2^(256) * a) % N
    Args:
        N : modulus
        a : operand
    Returns:
        result of the modular product
    """
    t = a
    m = 0
    for i in range(256):
        if (2**256 >> i) & 1:
            if m + t >= N:
                m = m + t - N
            else:
                m = m + t
        if t + t >= N:
            t = t + t - N
        else:
            t = t + t
    return m
```

```python
def montgomery_algorithm(N, a, b):
    """
    Montgomery Algorithm to compute (a * b * 2^-256) % N
    Args:
        N : modulus
        a : operand 1
        b : operand 2
    Returns:
        result of Montgomery multiplication
    """
    m = 0
    for i in range(256):
        if (a >> i) & 1:
            m += b
        if m % 2 == 1:
            m += N
        m //= 2
    if m >= N:
        m -= N
    return m
```

```python
def rsa256_mont(N, y, d):
    m = 1
    t = modulo_product(N, y)
    # Iterate over the bits of the exponent d
    for i in range(256):
        if (d >> i) & 1:
            m = montgomery_algorithm(N, m, t)
        t = montgomery_algorithm(N, t, t)
    return m
```

### Modules / Submodules

#### RsaPrep

do `modulo_product(N, a)`

![state machine](./doc/prep%20mont%20state.png)

* `S_IDLE`: wait for master module call
* `S_CALC`: do the for-loop in the pseudocode, need 256 cycles
* `S_DONE`: output the result and set the finish signal to 1

#### RsaMont

do `montgomery_algorithm(N, a, b)`

![state machine](./doc/prep%20mont%20state.png)

* `S_IDLE`: wait for master module call
* `S_CALC`: do the for-loop in the pseudocode, need 256 cycles
* `S_DONE`: output the result and set the finish signal to 1

#### Rsa256Core

do `rsa256_mont(N, y, d)`

![state machine](./doc/core%20state.png)

* `S_IDLE`: wait for master module call
* `S_PREP`: do `modulo_product(N, a)`. if done, go to `S_MONT`
* `S_MONT`: do `montgomery_algorithm(N, m, t)` and `montgomery_algorithm(N, t, t)` parallelly. if both done, go to `S_MONT`
* `S_CALC`: do the for-loop in the pseudocode, need 256 cycles. output the result and set the finish signal to 1 in the last cycle

### Python Helpers

#### RsaPrep

1. modify n and input file
    ```python
    # src/pc_python/golden/prep.py

    # Example usage
    n = 0xCA3586E7EA485F3B0A222A4C79F7DD12E85388ECCDEE4035940D774C029CF831  # Define N as hexadecimal
    enc = extract_hex_numbers('enc1.txt')
    ```
2. run python
    ```shell
    cd src/pc_python/golden
    source prep.py
    ```
3. checkout the log at `src/pc_python/golden/prep.log`

#### RsaMont

1. modify n, a, b
    ```python
    # src/pc_python/golden/mont.py

    # Example usage
    n = 0xca3586e7ea485f3b0a222a4c79f7dd12e85388eccdee4035940d774c029cf831
    a = 0x34736a22e7f1e3b8be59f3603c4d8b1a64f21d770743a9318c0cebcdb67b1eff
    b = 0x34736a22e7f1e3b8be59f3603c4d8b1a64f21d770743a9318c0cebcdb67b1eff
    ```
2. run python
    ```shell
    cd src/pc_python/golden
    source mont.py
    ```
3. checkout the log at `src/pc_python/golden/mont.log`

#### Rsa256Core

1. modify n, a, b
    ```python
    # src/pc_python/golden/mont.py

    # Example usage
    # Example parameters to test the functions
    N = 0xCA3586E7EA485F3B0A222A4C79F7DD12E85388ECCDEE4035940D774C029CF831  # Example modulus
    y = 0xc6b662ecb173c53cc7bb4212057f9c0ba283e000b98c9dcf5feaee7d6c933dfb
    d = 0xB6ACE0B14720169839B15FD13326CF1A1829BEAFC37BB937BEC8802FBCF46BD9  # Example exponent
    ```
2. run python
    ```shell
    cd src/pc_python/golden
    source core.py
    ```
3. checkout the log at `src/pc_python/golden/core.log`

## Part 2: Wrapper

### How To Run Wrapper Simulation

1. run the following commands in the terminal
    ```shell
    cd Lab2/src/tb_verilog
    source wrapper.sh
    nWave &
    ```

2. open nWave and open the file `src/tb_verilog/wrapper.fsdb`
3. select desired signals

### Testbench Files Explanation

1. Input: `wrapper_input.txt` contains 288 lines.
   1. first 32 lines are n
   2. second 32 lines are d
   3. last 32*7 lines are 7 encoded data
2. Output: `wrapper_output.txt` contains 217 lines, which is 7 decoded data. Each data contains 31 lines

### State Machine

![state](./doc/wrapper%20state.png)

## Part 3: How To Check Registers' Type

```shell
cd Lab2/src/
dv -no_gui
read_sverilog Rsa256Core.sv
read_sverilog Rsa256Wrapper.sv
```


## Part 4: How To Run

1. Press reset button on FPGA
2. Run python
    ```shell
    python3 rs232.py <YOUR COM> # modify the COM
    ```