clc;
clear all;
close all;
 
% Define the necessary parameters
bitstream = [0 1 0 0 1 1 0 1];
n = length(bitstream);
sampleperbit = 100;
highlogicvoltlevel = +5;
lowlogicvoltlevel = -5;
t = 0:1/sampleperbit:n;
 
% Loop through each bit in the bit stream
for i = 1:1:n
    if bitstream(i) == 1
        digitalsignalvoltage(i) = highlogicvoltlevel;
    else
        digitalsignalvoltage(i) = lowlogicvoltlevel;
    end
end
 
% Generate the digital signal based on the bit stream and sampling
totalsample = 1:1:(n+1)*sampleperbit;
for i = 1:1:n
    for j = i:1/sampleperbit:i+1
        digitalsignal(totalsample(i*sampleperbit:(i+1)*sampleperbit)) = digitalsignalvoltage(i);
    end
end
% Remove initial samples to match time vector
digitalsignal = digitalsignal(sampleperbit:end);
 
% Plot the digital input signal
subplot(3,1,1);
plot(t, digitalsignal,'green', 'linewidth', 2);
axis([-0.05 n+0.05 lowlogicvoltlevel-2 highlogicvoltlevel+2]);
xlabel('Time(sec)');
ylabel('Amplitude(volt)');
title('Digital Input Signal');
grid on;
 
% Define parameters for analog carrier signal
Vc = 5;
fc = 4;
thetac = 0;
% Generate the carrier signal
carriersignal = Vc .* sin(2 * pi * fc * t + thetac);
% Plot the carrier signal
subplot(3,1,2);
plot(t, carriersignal);
axis([-0.05 n+0.05 lowlogicvoltlevel-2 highlogicvoltlevel+2]);
xlabel('Time(sec)');
ylabel('Amplitude(volt)');
title('Carrier Signal');
grid on;
 
amplitudeDeviation = 2.0;
amplitudecomponentforsymbolone = Vc + amplitudeDeviation;
amplitudecomponentforsymbolzero = Vc - amplitudeDeviation;
phasecomponent = 0;
 
% Generate the modulated signal
for i = 1:1:(n * sampleperbit + 1)
    % Check the digital signal and modulate accordingly
    if digitalsignal(i) == highlogicvoltlevel
        amplitudecomponent(i) = amplitudecomponentforsymbolone;
    else
        amplitudecomponent(i) = amplitudecomponentforsymbolzero;
    end
end
 
% Modulate the signal with amplitude and carrier frequency
modulatedsignal = amplitudecomponent .* sin(2 * pi * fc * t + phasecomponent);
% Plot the modulated signal
subplot(3,1,3);
plot(t, modulatedsignal);
axis([-0.05 n+0.05 -Vc-1.5 Vc+1.5]);
xlabel('Time(sec)');
ylabel('Amplitude(volt)');
title('Modulated Signal');
grid on;