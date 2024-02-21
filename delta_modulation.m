% Clear command window, workspace, and close all figures
clc;
clear all;
close all;
 
% Define parameters for analog signal
A = 5;            
f = 1;           
theta = 0;      
minTime = 0;    
maxTime = 2;   
samplePerTime = 100;
t = minTime : 1/samplePerTime : maxTime; % Time vector for analog signal
 
% Generate analog signal (sine wave)
analogSignal = A * sin(2*pi*f*t + theta);
figure;
subplot(2,1,1);
plot(t , analogSignal);
axis([minTime maxTime -A-1 A+1]); 
hold on; 
 
% Calculate the sampling rate and create time vector for discrete sampling
samplingRate = 30*f;
sampleTime = minTime : 1/samplingRate : maxTime;
 
% Sample the analog signal
sampledSignal = A * sin(2*pi*f*sampleTime + theta);
 
% Initialize variables for digital signal conversion
digitalData = [];
staircaseSignal = 0;
delta = 1;
 
% Convert the sampled signal to digital data using staircase approximation
for i = 1:1:(samplingRate*maxTime)
    if sampledSignal(i) > staircaseSignal(i)
        digitalData(i+1) = 1;
        staircaseSignal(i+1) =  staircaseSignal(i) + delta;
    else
        digitalData(i+1) = 0;
        staircaseSignal(i+1) = staircaseSignal(i) - delta;
    end
end
 
% Plot the staircase approximation of the sampled signal
stairs(sampleTime, staircaseSignal);
ax = gca;
ax.XTick = [0:1/samplingRate:maxTime]; 
ax.YTick = [-(A+0.1):delta:(A+0.1)];  
xlabel('Time (sec)');  
ylabel('Amplitude (volts)');
title('Digital Signal'); 
grid on;
 
% Calculate time vector for digital data
digitalDataLength = length(digitalData);
t1 = 0 : maxTime / (digitalDataLength-1) : maxTime;
 
% Plot the digital output signal
subplot(2,1,2);
stairs(t1, digitalData);
axis([minTime-0.05 maxTime+0.05 -0.1 +1.1]); 
title('Digital Output Signal');