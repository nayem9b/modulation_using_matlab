clc;
clear all;
close all;
bitstream=[0 1 0 0 1];
n=length(bitstream);
highLogicLevelVoltage=+5;
lowLogicLevelVoltage=-5;
samplePerBit=100;
t=0:1/samplePerBit:n;
for i = 1:1:n
    if bitstream(i)==1
        
    else
        
    end
end