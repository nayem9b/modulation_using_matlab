clc;
clear all;
close all;
bitstream = [0 1 0 0 1];
n = length(bitstream);
highlogiclevelvoltage = +5;
lowlogiclevelvoltage = -5;
sampleperbit = 100;
t = 0:1/sampleperbit:n;
%(defining -5 for logic 0 and +5 for logic 1)
for i=1:1:n
if bitstream(i)==1
digitalsignalvoltage(i) = highlogiclevelvoltage;
else
digitalsignalvoltage(i) = lowlogiclevelvoltage;
end
end
totalsample = 1:1:(n+1)*sampleperbit;
%taking 100 (-5) or (5) for per bit
%in the loop there are 601 samples. first 100(0-99) samples are zero.
for i=1:1:n
for j=i:1/sampleperbit:i+1
digitalsignal(totalsample(i*sampleperbit):(i+1)*sampleperbit) = digitalsignalvoltage(i);
end
end
%eliminating firs 100 samples as they are out of the bit stream.
digitalsignal = digitalsignal(sampleperbit:end);
%plotting the digital signal with 501 sample
subplot(3,1,1);
plot(t,digitalsignal);
axis([0 n lowlogiclevelvoltage-1 highlogiclevelvoltage+1]);
xlabel('Time(sec)');
ylabel('Amplitude(volts)');
title('Message Signal');
%plotting the carrier signal
Ac =5;
fc=4;
phic = 0;
subplot(3,1,2);
carriersignal = Ac.*sin(2*pi*fc*t+phic);
plot(t,carriersignal);
axis([-0.05 n+0.05 lowlogiclevelvoltage-1 highlogiclevelvoltage+1]);
xlabel('Time(sec)');
ylabel('Amplitude(volts)');
title('Carrier Signal');
grid on;
%modulating process
frequencyseparetion = 2;
phasecomponentforsymbolone = 2.*pi.*(frequencyseparetion/2);
phasecomponentoforsymbolzero = -2.*pi.*(frequencyseparetion/2);
amplitudecomponent = 1;
for i= 1:1:(n*sampleperbit+1)
if digitalsignal(i) == highlogiclevelvoltage
phasecomponent(i) = phasecomponentforsymbolone;
else
phasecomponent(i) = phasecomponentoforsymbolzero;
end
end
%making the modulated signal and plotting it
modulatedsignal = amplitudecomponent*Ac.*cos((2*pi*fc+phasecomponent).*t);
subplot(3,1,3);
plot(t,modulatedsignal);
axis([-0.05 n+0.05 -Ac-3 Ac+3]);
xlabel('Time(sec)');
ylabel('Amplitude(volts)');
title('Modulated Signal');
grid on;