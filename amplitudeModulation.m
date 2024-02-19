clc;
close all;
clear all;
V_m = 10;
V_c = 5;
f_m = 4;
f_c = 40;
phi_m = 0;
phi_c = 0;
m_a = 2;
t = 0: 0.0001: 1;
modulating_signal = V_m.*sin(2.*pi.*f_m.*t + phi_m);
carrier_signal = V_c.*sin(2.*pi.*f_c.*t + phi_c);
amplitude_amplified_signal =V_c.*(1+m_a.*cos(2.*pi.*f_m.*t)).*cos(2.*pi.*f_c.*t);
subplot(3,1,1);
plot (t, modulating_signal);
title('Modulating Signal');
xlabel('time')
ylabel('Amplitude')
subplot(3,1,2);
plot (t, carrier_signal,'red');
title('Carrier Signal');
xlabel('time')
ylabel('Amplitude')
subplot(3,1,3);
plot (t, amplitude_amplified_signal,'blue');
title('Amplitude Amplified Signal');
xlabel('time')
ylabel('Amplitude')