clc;
clear all;
close all;

A = 5;
f = 1;
minTime = 0;
maxTime = 1;
theta = 0;
samplePerTime = 100;
t = minTime : 1/samplePerTime : maxTime;
analogSignal = A*sin(2*pi*f*t + theta);
subplot(4,1,1);
plot(t , analogSignal);
axis([minTime maxTime -A-1 A+1]);
xlabel('Time (sec)');
ylabel('Amplitude (volts)');
title('Analog Signal');
grid on;

samplingRate = 30*f;
totalSample = minTime : 1/samplingRate : maxTime;
sampledSignal = A*sin(2*pi*f*totalSample + theta);

subplot(4,1,2);
stem(totalSample ,sampledSignal );
xlabel('Time (sec)');
ylabel('Amplitude (volts)');
title('Sampled Signal');
grid on;
%disp(sampledSignal);

n = 8;
L = 2^n;
minV = -A;
maxV = +A;
delta = (maxV - minV)/L;
partition = minV : delta : maxV;
%disp(partition);
codebook = minV - (delta/2) : delta : maxV + (delta/2);
%disp(codebook);
[index,quants] = quantiz(sampledSignal,partition,codebook);
%disp(index);
%disp(quants);
subplot(4,1,3);
stem(totalSample ,sampledSignal );
xlabel('Time (sec)');
ylabel('Amplitude (volts)');
title('Quantized Signal');
grid on;

codematrix = de2bi(index,'left-msb');
k = 1;
for i=1:1:length(index);
    for j=1:1:n
        codevector(k)=codematrix(i,j);
        k=k+1;
    end
end
disp(codevector);
subplot(4,1,4);
stairs(codevector);

