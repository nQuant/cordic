# Cordic algorithm implementation

The cordic algorithm can be used by 2 differents ways. It can be used to compute the arctangent of a non-null coordinated point or to compute the cosine and the sine of an angle.

We give here a first Matlab implementation of the algorithm then we transfer it to a VHDL code for FPGA.

# Example

The cordic algorithm is often used for geometric transformation. But here, we provide a sample for a digital frequency-modulation.
The modulator will compute the cosine and the sine given the phase of the signal.
The demodulator will compute the phase given the cosine and the sine of the signal.
