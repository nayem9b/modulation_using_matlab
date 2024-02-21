clc;
clear all;
close all;

bitstream =[0 1 0 0 1 1 0 1];
n=length(bitstream);
samplePerBit=100;
highLogicLevelVolt=+5;
lowLogicLevelVolt=-5;
t=0:1/samplePerBit:n;

% Loop through each bit in bitstream
for i = 1:1:n
    if bitstream(i)==1
        digitalSignalVoltage(i)=highLogicLevelVolt;
    else
        digitalSignalVoltage(i)=lowLogicLevelVolt;
    end
end

% Generate digital signal based on the bit stream
totalSample=1:1:(n+1)*samplePerBit;
for i = 1:1:n
    for j = i:1/sampleperbit:i+1
        digitalsignal(totalsample(i*sampleperbit:(i+1)*sampleperbit)) = digitalsignalvoltage(i);
    end
end
% Remove initial samples to match time vector
digitalsignal = digitalsignal(sampleperbit:end);