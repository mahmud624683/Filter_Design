# Digital Filter Design Repository

This repository contains implementations of Finite Impulse Response (FIR) and Infinite Impulse Response (IIR) digital filters in MATLAB and HDL (Verilog/SystemVerilog). The designs include simulation files, testbenches, and documentation.

## Repository Structure

```
├── fir/                          # FIR filter implementation
│   ├── fir_eda_sim_files/        # EDA simulation files for FIR
│   │   ├── .simvision            # Cadence SimVision files
│   │   ├── design.sv             # SystemVerilog design
│   │   ├── testbench.sv          # Testbench for FIR filter
│   │   └── filter_dump.vcd       # Simulation waveform dump
│   │
│   ├── fir_matlab_code/          # MATLAB implementation
│   │   ├── fir_filter.m          # FIR filter design and testing
│   │   └── signal_reconstruct.m  # Signal processing utilities
│   │
│   ├── fir_verilog_code/         # Verilog implementation
│   │   ├── fir.v                 # FIR filter core
│   │   └── filter_testbench.v    # Verilog testbench
│   │
│   └── fir_doc.pdf               # FIR filter documentation
│
├── iir/                          # IIR filter implementation
│   ├── iir_eda_sim_files/        # EDA simulation files for IIR
│   │   ├── .simvision            # Cadence SimVision files
│   │   ├── design.sv             # SystemVerilog design
│   │   ├── testbench.sv          # Testbench for IIR filter
│   │   └── filter_dump.vcd       # Simulation waveform dump
│   │
│   ├── iir_matlab_code/          # MATLAB implementation
│   │   ├── iir_filter.m          # IIR filter design and testing
│   │   └── signal_reconstruct.m  # Signal processing utilities
│   │
│   ├── iir_verilog_code/         # Verilog implementation
│   │   ├── iir.v                 # IIR filter core
│   │   └── filter_testbench.v    # Verilog testbench
│   │
│   └── iir_doc.pdf               # IIR filter documentation
│
└── README.md                     # This file
```

## Filter Designs

### FIR Filter (Finite Impulse Response)
- **Order**: 8th order bandpass filter
- **Sampling Rate**: 48 kHz
- **Cutoff Frequencies**: 8 kHz and 16 kHz
- **Implementation**: 
  - MATLAB: `fir/fir_matlab_code/fir_filter.m`
  - Verilog: `fir/fir_verilog_code/fir.v`

The output sequence is given by:
```
y[n] = Σ b_i x[n - i] for i = 0 to N
```
where b_i are the filter coefficients and N is the filter order.

### IIR Filter (Infinite Impulse Response)
- **Order**: 9th order highpass filter
- **Sampling Rate**: 48 kHz
- **Cutoff Frequency**: 8 kHz
- **Passband Ripple**: 0.5 dB
- **Implementation**:
  - MATLAB: `iir/iir_matlab_code/iir_filter.m`
  - Verilog: `iir/iir_verilog_code/iir.v`

The output sequence is given by:
```
y[n] = Σ b_i x[n - i] - Σ a_j y[n - j] for i,j = 0 to N
```
where b_i are feedforward coefficients, a_j are feedback coefficients, and N is the filter order.

## Simulation Results
Waveform dumps from simulations are available in:
- FIR: `fir/fir_eda_sim_files/filter_dump.vcd`
- IIR: `iir/iir_eda_sim_files/filter_dump.vcd`

## Getting Started

1. **MATLAB**:
   - Run the respective filter design scripts (`fir_filter.m` or `iir_filter.m`)
   - The scripts include test signals and frequency response analysis

2. **Verilog Simulation**:
   - Use the provided testbenches (`testbench.sv` or `filter_testbench.v`)
   - Simulation scripts and waveform dumps are included

## Documentation
Detailed documentation for each filter type is available in:
- `fir/fir_doc.pdf`
- `iir/iir_doc.pdf`

## License
This project is licensed under the MIT License - see the LICENSE file for details.
