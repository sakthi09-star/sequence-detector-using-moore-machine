# sequence-detector-using-moore-machine
Moore FSM-based sequence detector in Verilog that detects the pattern "1111". Output goes HIGH only in the detect state (S4). Uses synchronous reset, clocked state transitions, and combinational next-state logic. Includes testbench with waveform generation and verification.

# Moore Sequence Detector (Verilog)

## Overview
This project implements a Moore Finite State Machine (FSM) in Verilog to detect the input sequence "1111". The output goes HIGH only when the full sequence is detected, and it depends only on the current state (Moore type).


## Design Description
The FSM moves through states when input is `1` and resets to IDLE when input is `0`.

State flow:
IDLE → S1 → S2 → S3 → S4 (DETECTED)

At state S4, output `det_out = 1`.

If input becomes 0 at any stage, FSM returns to IDLE.


## Files

### 1. sequence_detector_moore.v (Design Module)
- 5-state Moore FSM
- Synchronous state update using clk and rst
- Next state logic based on seq_in
- Output depends only on present state

### 2. sequence_detector_moore_tb.v (Testbench)
- Generates 10ns clock
- Applies reset
- Tests sequence: 1111 twice
- Dumps waveform to moore.vcd
- Uses $monitor for output tracking


## Input / Output

Inputs:
- clk   : Clock signal
- rst   : Active high reset
- seq_in: Serial input bit

Output:
- det_out: HIGH when "1111" is detected


## Simulation Details
- Clock period: 10 ns
- Reset: held for 2 clock cycles
- Test pattern: 1111, 1111


## Key Features
- Moore FSM design
- Clean state-based output
- No glitches in output
- Simple sequence detection logic
- Beginner friendly Verilog project



## Author
RTL Design Project for learning FSM concepts and FPGA/VLSI basics
