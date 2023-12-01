clc;
clear;
close all;

%%The 9th order highpass IIR filter was designed using MATLAB with a sample
%%rate of 48 kHz. cutoff frequency 8kHz
n=9;
rp=0.5;
fs = 48000;
f1 = 8000;
[b,a] = cheby1(n,rp,2*f1/fs,'high');
freqz(b,a,[],fs);



% Generating analog input signal with harmonics
fs = 48000;
dt = 1/fs;
StopTime = 2e-3; % Overall 2ms input signal
t = (0:dt:StopTime-dt)';
L = length(t);
Fc = fs/2;
fac = 0.2;
x = 0.2*sin(2*pi*Fc*t*fac)+0.4*sin(2*pi*2*Fc*t*fac)+0.3*sin(2*pi*2*(Fc/4)*t*fac);
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
fx = filter(b,a,x);
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
n_bit = 8;
L = 2^n_bit;
lx = min(x);
qx = (max(x)-lx)/L;

len = max(size(x));

for i=1:len
    x(i) = round((x(i)-lx)/qx);
end
disp('Input Signal:')
disp(dec2bin(x))
disp('         ')



%Quatized filter coeff 64 bit
n_bit=8;
L=2^n_bit;
lb = min(b);
qb = (max(b)-lb)/L;

len = max(size(b));

for i=1:len
    b(i) = round((b(i)-lb)/qb);
end
disp('feedforward coefficients, b:')
disp(dec2bin(b))
disp('         ')

la = min(a);
qa = (max(a)-la)/L;

len = max(size(a));

for i=1:len
    a(i) = round((a(i)-la)/qa);
end

disp('feedback coefficients, a:')
disp(dec2bin(a))
disp('         ')


