clc;
clear;
close all;

%%The 8th order bandpass FIR & IIR filter was designed using MATLAB with a sample
%%rate of 48 kHz. cutoff frequency 8kHz & 16kHz
n = 8;
fs = 48000;
f1 = 8000;
f2 = 16000;
b = fir1(n,[2*f1/fs 2*f2/fs]);
freqz(b,1,[],fs);
subplot(2,1,1);
ylim([-30 10]);

% Generating random analog input signal with harmonics
fs = 48000;
dt = 1/fs;
StopTime = 2e-3; % Overall 2ms input signal
t = (0:dt:StopTime-dt)';
L = length(t);
Fc = fs/2;
a = 0.2;
x = 0.2*sin(2*pi*Fc*t*a)+0.4*sin(2*pi*2*Fc*t*a)+0.3*sin(2*pi*2*(Fc/4)*t*a);
%x = 0.2*sin(2*pi*Fc*t*a);
x = abs(x);

% Plot the input signal versus time
figure;
plot(round(t*1e9),x);
xlabel('time (in nanoseconds)');
title('Signal versus Time');

% Plot frequency components of input signal
Y = fft(x);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = fs*(0:(L/2))/L;
figure;
plot(f,P1);
title('Single-Sided Amplitude Spectrum of X(t)');
xlabel('f (Hz)');
ylabel('|P1(f)|');


% Plot the output signal versus time
fx = filter(b,1,x);
figure;
plot(round(t*1e9),fx);
xlabel('time (in nanoseconds)');
title('Signal versus Time'); 


%Plot frequency components of filtered signal
Y = fft(fx);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = fs*(0:(L/2))/L;
figure;
plot(f,P1);
title('Single-Sided Amplitude Spectrum of X(t)');
xlabel('f (Hz)');
ylabel('|P1(f)|');

% Quantizing analog input in 8 bits to put as filter input
lx = min(x);
qx = (max(x)-lx)/255;

len = max(size(x));

for i=1:len
    x(i) = round((x(i)-lx)/qx);
end
disp('Input Signal:')
disp(dec2bin(x))
disp('         ')

%Quatized filter coeff
lb = min(b);
qb = (max(b)-lb)/255;

len = max(size(b));

for i=1:len
    b(i) = round((b(i)-lb)/qb);
end

disp('Filter Coefficient b:')
disp(dec2bin(b))
