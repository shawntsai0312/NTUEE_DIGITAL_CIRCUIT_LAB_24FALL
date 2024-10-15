# Lab3 Guideline

The roadmap of this lab:

1. Implement I2C to initlize the WM8731 chip.
2. Control the DAT/CLK signals of WM8731 chip to make a recorder.

## Implement the I2C Module
You have to use I2C to initialize the WM8731 chip,
and we have provided recommended booting sequence for you.
Since we cannot build circuit with a fixed-perioded clock with SystemVerilog,
we need a reference clock to build the SCLK/SDAT of I2C.

The reference clock (again, not SCLK) should be 100kHz or less,
and you should use PLL to make a slower clock from a 50MHz (default clock) or
12MHz (BCLK) clock.
This job is left to you intentionally.
(You should NEVER use a counter to make a slower clock from a faster clock!)

## Implement Your Recorder
Ideally, you have to enable this part only after the I2C initialization.
However, in a real world, passing between different clock domains is not trivial.
So we just assume that the initialization is done right after the reset.

You should use the 12MHz BCLK instead of the 50MHz default clock since it would be simpler.
Both ADCCLK and DACCLK are inverted every hundreds of cycle,
and you can read/write the ADCDAT/DACDAT to record/play sound.
You should read the specification for more details.

Should we take care of XCLK in this lab?
Try to figure it out from the *power down modes* register of WM8731.

# Requirements
Lab requirements are:

* Implement a audio recorder/player with 16-bit resolution with FPGA,
  which should be able to record for 30 seconds.
* You have to support 2x\~8x faster and 2\~8x slower play mode as well.
* For slow play mode, you have to support piecewise-constant and linear interpolation
  (You should have learned that in Signal and System).

## Bonus
You can record for 30 minutes with the SDRAM or build GUI with the touch panel.
If you try to do so, then Qsys and built-in IPs may help you.

# Appendix
## File Structure

* src/DE2\_115
	* All files related to the FPGA, note that the sdc file is different from previous labs.

## nLint
The same as lab1 and 2, just copy the lint/ directory.

## Simulation
We don't provide a testbench in this lab.
For the first part, the I2C protocol is quite simple.
And it's hard to simulate owing to the limitation (you must play audio through SSH).

