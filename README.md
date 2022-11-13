##Implementation of IIR-Notch-Filter

The aim of this project is to design and implement an Infinite Impulse Response (IIR) filter on Don_Giovanni_1.wav audio signal so as to cancel the unwanted signal associated with the audio. The project uses Matlab R2022a version to develop the filter.

The major requirement in this project is to design an Infinite Impulse Response (IIR) Filter to cancel the noising frequencies in the given audio file. The type of IIR filter required to be used is the IIR Notch filter.

An IIR Notch filter is a band stop filter with a very narrow stop band and two pass bands. It removes a particular frequency component from the input signal while leaving the amplitude of the other frequencies more or less unchanged.

#Result

At the final output, we check the validity of our signal processing by playing the file before and after filtering. We also plotting the spectrum on a logarithmic scale before and after filtering. The figure shown below are the Original audio signal and Spectrum of Filtered Signal

![image](https://user-images.githubusercontent.com/72307168/201515766-cc7dc6c8-6dbc-490e-9020-ef07922392e0.png)

![image](https://user-images.githubusercontent.com/72307168/201515773-5b7ce2b3-3fb4-4712-86ac-825e10d63f82.png)
