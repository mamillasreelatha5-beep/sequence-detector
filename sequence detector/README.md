# Sequence Detector

## Description

This project implements a simple sequence detector using Verilog HDL.

The circuit detects the sequence `1011` from a serial input.

Whenever the complete sequence `1011` is received, the output `detected` becomes `1`.

## Objective

To design a sequential circuit that detects the binary sequence:

    1011

## Inputs

| Input | Description |
|------|-------------|
| `clk` | Clock signal |
| `reset` | Resets the detector |
| `data_in` | Serial input bit |

## Output

| Output | Description |
|--------|-------------|
| `detected` | Becomes 1 when `1011` is detected |

## Working

The detector checks one bit at a time.

Example:

    Input: 1 0 1 1

When the complete sequence `1011` is received:

    detected = 1

## States

| State | Description |
|------|-------------|
| S0 | No bits detected |
| S1 | `1` detected |
| S2 | `10` detected |
| S3 | `101` detected |

## Files

- `README.md` - Project documentation
- `sequence_detector.v` - Main Verilog code
- `sequence_detector_tb.v` - Testbench
- `output.vcd` - Simulation waveform

## How to Run

Compile:

    iverilog -o sequence_sim sequence_detector.v sequence_detector_tb.v

Run:

    vvp sequence_sim

Open waveform:

    gtkwave output.vcd

## Expected Result

For the input sequence:

    1011

the output `detected` becomes:

    1

## Conclusion

The sequence detector successfully detects the binary sequence `1011` using Verilog HDL.