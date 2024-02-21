clc;
clear all;
close all;
 
Vm = 10;
Vc = 5;
fm = 4;
fc = 40;
phi_m = 0;
phi_c = 0;
Ma = 2;
t = 0:0.0001:1;
% Modulating Signal
modulatingSignal = Vm*sin(2*pi*fm*t + phi_m)
subplot(3,1,1);
plot(t, modulatingSignal);
axis([0 1 -Vm-1.5 Vm+1.5]);
xlabel('Time');
ylabel('Amplitude');
title('Modulating Signal');
 
% Carrier Signal 
carrierSignal = Vc*cos(2*pi*fc*t + phi_c);
subplot(3,1,2);
plot(t,carrierSignal);
axis([0 1 -Vc-1 Vc+1]);
xlabel('Time');
ylabel('Amplitude');
title('Carrier Signal');
 
% Modulating Signal
modulatedSignal = Vc.*cos(2*pi.*fc.*t).*(1 + Ma.*cos(2*pi.*fm.*t))
subplot(3,1,3);
plot(t, modulatedSignal);
xlabel('Time');
ylabel('Amplitude');
title('Modulated Signal');