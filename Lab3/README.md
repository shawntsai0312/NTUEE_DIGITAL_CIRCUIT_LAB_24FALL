# Lab 3 數位錄音機

### File Structures

```
.
├── Guideline.md
├── README.md
├── doc
│   ├── Lab3_lecture.pdf
│   ├── Lab3_sup1_audiocodec.pdf
│   ├── Lab3_sup2_mem.pdf
│   ├── Lab3_sup3_lcd.pdf
│   ├── Lab3_sup4_ctrlpanel.pdf
│   ├── auddsp.drawio
│   ├── audplayer.drawio
│   ├── audrecorder.drawio
│   ├── i2c.drawio
│   ├── structure.drawio
│   ├── team04_lab3.pdf
│   └── top state.drawio
├── sim
│   ├── sh
│   │   ├── AudDSP
│   │   │   └── run.sh
│   │   ├── AudPlayer
│   │   │   └── run.sh
│   │   ├── AudRecorder
│   │   │   └── run.sh
│   │   ├── I2cInitializer
│   │   │   └── run.sh
│   │   ├── Top
│   │   │   └── run.sh
│   │   └── tool.sh
│   └── tb
│       ├── AudDSP
│       │   ├── data.py
│       │   ├── golden
│       │   │   ├── constant
│       │   │   │   ├── constant_2.txt
│       │   │   │   ├── constant_3.txt
│       │   │   │   ├── constant_4.txt
│       │   │   │   ├── constant_5.txt
│       │   │   │   ├── constant_6.txt
│       │   │   │   ├── constant_7.txt
│       │   │   │   └── constant_8.txt
│       │   │   ├── fast
│       │   │   │   ├── fast_2.txt
│       │   │   │   ├── fast_3.txt
│       │   │   │   ├── fast_4.txt
│       │   │   │   ├── fast_5.txt
│       │   │   │   ├── fast_6.txt
│       │   │   │   ├── fast_7.txt
│       │   │   │   └── fast_8.txt
│       │   │   ├── linear
│       │   │   │   ├── linear_2.txt
│       │   │   │   ├── linear_3.txt
│       │   │   │   ├── linear_4.txt
│       │   │   │   ├── linear_5.txt
│       │   │   │   ├── linear_6.txt
│       │   │   │   ├── linear_7.txt
│       │   │   │   └── linear_8.txt
│       │   │   ├── mem.txt
│       │   │   └── normal.txt
│       │   └── tb.sv
│       ├── AudPlayer
│       │   ├── golden.txt
│       │   └── tb.sv
│       ├── AudRecorder
│       │   ├── data.py
│       │   ├── golden.txt
│       │   └── tb.sv
│       ├── I2cInitializer
│       │   ├── golden.txt
│       │   ├── tb.sv
│       │   └── tb_raw.sv
│       └── Top
│           ├── data.py
│           ├── golden
│           │   ├── constant
│           │   │   ├── constant_2.txt
│           │   │   ├── constant_3.txt
│           │   │   ├── constant_4.txt
│           │   │   ├── constant_5.txt
│           │   │   ├── constant_6.txt
│           │   │   ├── constant_7.txt
│           │   │   └── constant_8.txt
│           │   ├── fast
│           │   │   ├── fast_2.txt
│           │   │   ├── fast_3.txt
│           │   │   ├── fast_4.txt
│           │   │   ├── fast_5.txt
│           │   │   ├── fast_6.txt
│           │   │   ├── fast_7.txt
│           │   │   └── fast_8.txt
│           │   ├── linear
│           │   │   ├── linear_2.txt
│           │   │   ├── linear_3.txt
│           │   │   ├── linear_4.txt
│           │   │   ├── linear_5.txt
│           │   │   ├── linear_6.txt
│           │   │   ├── linear_7.txt
│           │   │   └── linear_8.txt
│           │   ├── mem.txt
│           │   └── normal.txt
│           └── tb.sv
└── src
    ├── Altpll
    │   ├── Altpll.bsf
    │   ├── Altpll.cmp
    │   ├── Altpll.html
    │   ├── Altpll.xml
    │   ├── Altpll_bb.v
    │   ├── Altpll_generation.rpt
    │   ├── Altpll_inst.v
    │   ├── Altpll_inst.vhd
    │   └── synthesis
    │       ├── Altpll.debuginfo.xml
    │       ├── Altpll.qip
    │       ├── Altpll.v
    │       └── submodules
    │           ├── Altpll_altpll_0.v
    │           ├── altera_reset_controller.sdc
    │           ├── altera_reset_controller.v
    │           └── altera_reset_synchronizer.v
    ├── AudDSP.sv
    ├── AudPlayer.sv
    ├── AudRecorder.sv
    ├── DE2_115
    │   ├── DE2_115.qsf
    │   ├── DE2_115.sdc
    │   ├── DE2_115.sv
    │   ├── Debounce.sv
    │   ├── FastSlow.sv
    │   └── SevenHexDecoder.sv
    ├── I2cInitializer.sv
    └── Top.sv
```

### How To Run on DE2-115 with QuartusII

 - [Tutorial Video 1](https://youtu.be/lxQ1CqLxdgA)
 - [Tutorial Video 2](https://youtu.be/XZyHApFdQvU)

### Before Simulation

```shell
cd Lab3/sim/
source tool.sh
```

### How To Run Simulation

1. run the following commands in the terminal
    ```shell
    cd Lab3/sim/sh/[MODULE_NAME]
    source run.sh
    nWave &
    ```

2. open nWave and open the file `sim/sh/tb_MODULE_NAME.fsdb`
3. select desired signals

### How To Check Registers' Type

```shell
cd Lab3/src/
dv -no_gui
read_sverilog Top.sv # or other file to be checked
```