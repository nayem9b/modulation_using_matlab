clc;
clear all;
close all;

Vm=5;
f=1;
thetam=0;
minTime=0;
maxTime=1;
samplePerTime=1000;
t=minTime:1/samplePerTime:maxTime;
t=t(1:end-1);

% Generating Modulatting signal
modulatingSignal= Vm .*sin(2*pi*f*t + thetam);

% Plot the modulating signal
subplot(3,1,1);
plot(t,modulatingSignal);
hold on;
axis([-minTime-0.01 maxTime+0.01 -2*Vm +2*Vm]);
xlabel('Time(sec)');
ylabel('Amplitude(volt)');
title('Modulating Signal');


% Generate the carrier pulse train
pulseTrain =[];
Vc=5;
fc=10;
n=fc*maxTime;
m=samplePerTime/fc;
duty=30;
on_t=duty*m/100;
off_t=m - on_t;
for i = 1:1:n
    pulseTrain(m*(i-1)+1:m*(i-1)+on_t)=Vc;
    pulseTrain(m*(i-1)+on_t+1:m*(i-1)+on_t+off_t)=0;
end

% generate sawtooth wave
sawtoothSignal = 1.8 * Vm * sawtooth(2*pi*fc*t);
subplot(3,1,1);
plot(t,sawtoothSignal);
grid on;


% Plot then carrier pulse train
subplot(3,1,2);
plot(t,pulseTrain);
grid on;
axis([-minTime-0.01 maxTime+0.01 -1 Vc+1]);
xlabel('Time(sec)');
ylabel('Amplitude(volts)');
title('Carrier Pulse Train');

% Perform pulse position modulation

modulatedSignal=zeros(1,length(pulseTrain));
for i = 1:1:n
    for j = 1:1:i*m
        if (modulatingSignal(m*(i-1)+j) < sawtoothSignal(m*(i-1)+j))
            modulatedSignal(m*(i-1)+j : m*(i-1)+j+on_t-1) = Vc;
            break
        end
    end
end

% Plot the modulated signal
subplot(3,1,3);
plot(t, modulatedSignal);
grid on;
axis([-minTime-0.01 maxTime+0.01 -1 Vc+1]);
xlabel('Time (sec)');
ylabel('Amplitude (volts)');
title('Modulated signal');