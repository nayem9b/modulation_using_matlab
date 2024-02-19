clc;
close all;
clear all;
A = 8;
f = 2;
phi = 0;
tmin = 0;
tmax = 1;
samplepertime = 100;
t = tmin: 1/samplepertime: tmax;
analogsignal = A.*sin(2*pi*f*t + phi);
subplot(2,1,1);
hold on;
plot(t,analogsignal);
axis([tmin-0.05 tmax+0.05 -A-1 +A+1]);
title('Analog signal');
samplingrate = 80*f;
sampletime = tmin: 1/samplingrate: tmax;
sampledsignal = A*sin(2*pi*f*sampletime);
delta = 1.25;
digitaldata = [];
staircasesignal = 0;
for i=1:1:(samplingrate*tmax)
if sampledsignal(i)>staircasesignal(i)
digitaldata(i+1) = 1;
staircasesignal(i+1)=staircasesignal(i)+delta;
else digitaldata(i+1) = 0;
staircasesignal(i+1)=staircasesignal(i)-delta;
end
end
stairs(sampletime,staircasesignal);
hold on;
ax = gca;
ax.XTick = [0:1/samplingrate:tmax];
ax.YTick = [(-A+2.5): delta: (A+2.5)];
xlabel('Time(sec)');
ylabel('Amplitude (volts)');
legend('Analog input signal', 'staircase signal');
title('Delta modulation');
digitaldatalength = length(digitaldata);
bittime = 0: tmax/(digitaldatalength-1): tmax;
subplot(2,1,2);
stairs(bittime,digitaldata);
axis([0 tmax -0.5 1.5]);
xlabel('Time(sec)');
ylabel('Amplitude (volts)');
title('Digital Signal');