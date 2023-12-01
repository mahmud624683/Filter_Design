clc;
clear;
close all;

%%The 8th order bandpass FIR & IIR filter was designed using MATLAB with a sample
%%rate of 48 kHz. cutoff frequency 8kHz & 16kHz
n=9;
rp=0.5;
fs = 48000;
f1 = 8000;
[b,a] = cheby1(n,rp,2*f1/fs,'high');

% Generating random analog input signal with harmonics
fs = 48000;
dt = 1/fs;
StopTime = 2e-3; % Overall 2ms input signal
t = (0:dt:StopTime-dt)';
L = length(t);
Fc = fs/2;
a = 0.2;
x = 0.2*sin(2*pi*Fc*t*a)+0.4*sin(2*pi*2*Fc*t*a)+0.3*sin(2*pi*2*(Fc/4)*t*a);
x = abs(x);
fx = filter(b,a,x);

%Read the output txt file
%xf = load('xrun_fir.txt');
xf = load('xrun_iir.txt');


% Deuantizing 20bit digital output to analogue signal
n = 20;
Lf = 2^n;
lx = min(fx);
qx = (max(fx)-lx)/Lf;
%these two coefficient are used for the amplitude change 
% to compare with matlab output. the values are chosen by trial
% and error method
dq_adj_cof = 1;
dc_ofset = 0.7;
len = max(size(xf));

for i=1:len
    xf(i) = dq_adj_cof*(xf(i)*qx+dc_ofset*lx);
end

% Plot the output signal versus time
figure;
plot(xf,'color','b');
hold on;
plot(fx,'color','r');
legend('verilog', 'matlab')
xlabel('time (in nanoseconds)');
title('Signal versus Time'); 

%Plot frequency components of filtered signal
%for matlab output
Y = fft(fx);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = fs*(0:(L/2))/L;

%for verilog output
Yf = fft(xf);
P2f = abs(Yf/L);
P1f = P2f(1:L/2+1);
P1f(2:end-1) = 2*P1f(2:end-1);
f = fs*(0:(L/2))/L;
figure;
plot(f,P1,'color','r');
hold on;
plot(f,P1f,'color','b');
legend('matlab', 'verilog')
title('Single-Sided Amplitude Spectrum of X(t)');
xlabel('f (Hz)');
ylabel('|P1(f)|');
