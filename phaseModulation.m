clc;
close all;
clear all;
V_m = 10;
V_c = 5;
f_m = 4;
f_c = 40;
phi_m = 0;
phi_c = 0;
m_p = 10;
t = 0: 0.0001: 1;
modulating_signal = V_m.*sin(2.*pi.*f_m.*t + phi_m);
carrier_signal = V_c.*sin(2.*pi.*f_c.*t + phi_c);
phase_amplified_signal = V_c.*sin(2.*pi.*f_c.*t + m_p.*sin(2.*pi.*f_m.*t));
subplot(3,1,1);
plot (t, modulating_signal);
title('Modulating Signal');
xlabel('time');
ylabel('Amplitude');
subplot(3,1,2);
plot (t, carrier_signal,'red');
title('Carrier Signal');
xlabel('time');
ylabel('Amplitude');
subplot(3,1,3);
plot (t, phase_amplified_signal,'black');
title('Phase Amplified Signal');
xlabel('time');
ylabel('Amplitude');