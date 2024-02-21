% Clear Command Window, Workspace, and Close all figures
clc;
clear all;
close all;
 
% Define amplitude, frequency, phase, time parameter and sample rate for the modulating signal
Vm = 1;
fm = 1;
phim = 0;
minTime = 0;
maxTime = 2;
% Define sampling rate
samplePerTime= 1000;
% Create time vector
t = minTime : 1/samplePerTime : maxTime;
t = t(1:end-1); % Adjust time vector to match the number of samples
 
% Generate modulating signal
modulatingsignal = Vm * sin(2 * pi * fm * t + phim);
 
% Plot modulating signal
subplot(4,1,1);
plot(t, modulatingsignal);
axis([minTime-0.05 maxTime+0.05 -1.2*Vm 1.2*Vm])
xlabel('Time (s)');
ylabel('Amplitude');
title('Modulating Signal');
grid on;
 
% Generate carrier pulses
pulseTrain = [];
Vc = 5;         % Amplitude of the carrier signal (volts)
fc = 10;         % Frequency of the carrier signal (Hz)
n = fc * maxTime;
m = samplePerTime/fc;
duty = 50;      % Duty cycle of the pulse train (in percentage and multiples of 10)
on_t = duty*m/100;
off_t = m - on_t;
for i = 1:1:n
    pulseTrain(m*(i-1)+1 : m*(i-1)+on_t) = Vc;          % On period
    pulseTrain(m*(i-1)+on_t+1 : m*(i-1)+on_t+off_t) = 0; % Off period
end
 
% Plot carrier pulses
subplot(4,1,2);
plot(t, pulseTrain);
axis([minTime-0.05 maxTime+0.05 -0.2 1.2*Vc]);
xlabel('Time (s)');
ylabel('Amplitude');
title('Carrier Pulse Train');
grid on;
 
% Generate double-sideband modulated signal
doublesidebms = modulatingsignal .* pulseTrain;
 
% Plot double-sideband modulated signal
subplot(4,1,3);
plot(t, doublesidebms);
axis([minTime-0.05 maxTime+0.05 -1.2*Vc 1.2*Vc]);
xlabel('Time (s)');
ylabel('Amplitude');
title('Double-Sideband Modulated Signal');
grid on;
 
% Generate single-sideband modulated signal
singlesidebms  = [];
for i = 1:1:length(doublesidebms)
    if doublesidebms(i) == 0
        singlesidebms = [singlesidebms, doublesidebms(i)];
    else
        singlesidebms = [singlesidebms, doublesidebms(i) + 3* Vc*Vm];
    end
end
% Plot single-sideband modulated signal
subplot(4,1,4);
plot(t, singlesidebms);
axis([minTime-0.05 maxTime+0.05 -1.01*Vc 4.4*Vc]);
xlabel('Time (s)');
ylabel('Amplitude');
title('Single-Sideband Modulated Signal');
grid on;
 