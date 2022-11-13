clc;
clear all;
close all;

%Import the audio sound
[y, Fs] = audioread('Don_Giovanni_1.wav');

%sound (y, Fs);
N = length(y);
disp(Fs)
disp(N)
Ts = 1/Fs;
t = 0:Ts:(N-1)*Ts;
Fint = Fs/N;
freq = 0:Fint:(N-1)*Fint;
figure (1)
plot(y) %plots the original audio signal of in time domain waveform
title('Time domain waveform of original audio signal');
xlabel('Time');
ylabel('Amplitude')
grid on;

Y = fft (y);
mag_Y= abs(Y);
figure (2)
plot(freq,mag_Y) %plots the original audio signal of in frequency domain
title('Spectrum of the original audio signal');
xlabel('Frequency');
ylabel('Amplitude')
grid on;

[m1, n1] = max (mag_Y(1:N/2));
N1 = freq(n1-1);

% filter zeroes and poles for filter 1
z0 = exp(j*2*pi*N1/Fs);
z0c = conj(z0);
p0 = 0.99*z0;
p0c = conj(p0);
z1 = [z0;z0c];
p1 = [p0;p0c];

% compute the coeeficiecnt of the zero ans poles
b0=1;
b1=-(z0+z0c);
b2=z0*z0c;
a0=1;
a1=-(p0+p0c);
a2= p0*p0c;
B1=[b0 b1 b2];
A1=[a0 a1 a2];
y1 = filter(B1,A1,y);
figure (3)
plot(y1) %plots the audio signal after removing the first noise in time domain waveform
title('Time domain waveform of audio signal after removing the first noise');
xlabel('Time');
ylabel('Amplitude')
grid on;

Y1 = fft (y1);
mag_Y1= abs(Y1);
figure (4)
plot(freq,mag_Y1) %plots the spectrum after removing the first noise
title('Spectrum after removing the first noise');
xlabel('Frequency');
ylabel('Amplitude');
grid on;

%sound(y1, Fs)
%designing filter for the second noise
[m2, n2] = max(mag_Y1(1:N/2));
N2 = freq(n2-1);
% filter zeroes and poles for filter 2
z1 = exp(j*2*pi*N2/Fs);
z1c = conj(z1);
p1 = 0.99*z1;
p1c = conj(p1);
z2 = [z1;z1c];
p2 = [p1;p1c];

% compute the coeeficiecnt of the zero ans poles
b3=1;
b4=-(z1+z1c);
b5=z1*z1c;
a3=1;
a4=-(p1+p1c);
a5= p1*p1c;
B2=[b3 b4 b5];
A2=[a3 a4 a5];
y2 = filter(B2,A2,y1);
figure (5)
plot(y2) %plots the audio signal after removing the second noise in time domain waveform
title('Time domain waveform of audio signal after removing the second noise');
xlabel('Time');
ylabel('Amplitude')
grid on;
Y2 = fft (y2);
mag_Y2= abs(Y2);
figure (6)
plot(freq,mag_Y2) %plots the spectrum after removing the second noise
title('Spectrum after removing the second noise');
xlabel('Frequency');
ylabel('Amplitude');
grid on;

%sound(y2, Fs)
figure(7)
zplane(z1,p1)
title ('Zeros and poles placment')
legend('zeros','poles')
grid on
figure(8)
zplane(z2,p2)
title ('Zeros and poles placment')
legend('zeros','poles')
grid on
figure (9)
semilogy(freq, mag_Y, 'r')
grid
hold on
semilogy(freq, mag_Y2, 'g')
title('Spectrum of Filtered Signal')
xlabel('Frequency in Hz')
ylabel('Spectrum of the filtered signal')
legend('Before Filtering','After Filtering')
