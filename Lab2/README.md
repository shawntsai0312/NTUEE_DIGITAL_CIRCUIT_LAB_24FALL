# Lab 2 RSA256 解密機

### Before Running

```shell
cd Lab2/src/tb_verilog
source tool.sh
```

### How To Run Core Simulation

1. run the following commands in the terminal
    ```shell
    cd Lab2/src/tb_verilog
    source core.sh
    nWave &
    ```

2. open nWave and open the file `src/tb_verilog/lab2.fsdb`
3. select desired signals

### How To Run Wrapper Simulation

1. run the following commands in the terminal
    ```shell
    cd Lab2/src/tb_verilog
    source wrapper.sh
    nWave &
    ```

2. open nWave and open the file `src/tb_verilog/wrapper.fsdb`
3. select desired signals

### How To Check Registers' Type

```shell
cd Lab2/src/
dv -no_gui
read_sverilog Rsa256Core.sv
read_sverilog Rsa256Wrapper.sv