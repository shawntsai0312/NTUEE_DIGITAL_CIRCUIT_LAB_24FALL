# Final 

### Before Running

```shell
cd Final/sim/
source tool.sh
```

### How To Run Simulation

1. run the following commands in the terminal
    ```shell
    cd Final/sim/sh/[MODULE_NAME]
    source run.sh
    nWave &
    ```

2. open nWave and open the file `sim/sh/tb_MODULE_NAME.fsdb`
3. select desired signals

### How To Check Registers' Type

```shell
cd Final/src/
dv -no_gui
read_sverilog Top.sv # or other file to be checked
```