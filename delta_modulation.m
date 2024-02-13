clear all;
close all;

A=5;
f=1;
theta=0;
minTime=0;
maxTime=1;
samplePerTime=100;
t=minTime : 1/samplePerTime;
analogSignal= A*sin(2*pi*f*t +theta);
figure;
plot(t,analogSignal);
disp(analogSignal);

samplingRate=30*f;
sampleTime=minTime :1/samplingRate: maxTime;
sampledSignal=A*sin(2*pi*f*sampleTime +theta);

digitalData=[];
stairCaseSignal=0;
delta=0.3;

for i=1:1:(samplingRate*maxTime)
    if sampledSignal(i)>stairCaseSignal(i)
        digitalData(i+1)=1;
        stairCaseSignal(i+1)=stairCaseSignal(i)+delta;
    else
        digitalData(i+1)=0;
        stairCaseSignal(i+1)=stairCaseSignal(i)-delta;
    end
end

disp(digitalData);
disp(stairCaseSignal);
subplot(4,1,2);
stem(sampleTime, sampledSignal);
xlabel("Time(sec)");
ylabel("Sampled Signal");
grid on;
hold on;
disp(sampledSignal);