Am = 3;
fm = 2;
phim = 0;
tmin = 0;
tmax = 1;
samplepertime = 10000;
t = tmin: 1/samplepertime: tmax;
modulatingsignal = Am.*sin(2*pi*fm*t + phim);
subplot(4,1,1);
plot(t,modulatingsignal);
axis([-tmin-0.05 tmax+0.05 -Am-.5 +Am+.5]);
xlabel('Time(sec)');
ylabel('Amplitude(volts)');
title('Modulating signal');
hold on;
%pulse train
fc = 10;
Ac = 5;
carrierpulses = Ac*square(2*pi*fc*t)+Ac;
%adding the 'Ac' makes both side pulse train to one side pluse train
subplot(4,1,2)
plot(t,carrierpulses);
axis([-tmin-0.05 tmax+0.05 -1 2*Ac+1]);
xlabel('Time(sec)');
ylabel('Amplitude(volts)');
title('Pulse Train');
sawtoothsignal = (Am+1).*sawtooth(2*pi*fc*t);
subplot(4,1,1)
plot(t,sawtoothsignal);
for i=1:length(sawtoothsignal)
if (modulatingsignal(i)<=sawtoothsignal(i))
    modulatedsignal(i) = 0;
elseif (modulatingsignal(i)>sawtoothsignal(i))
modulatedsignal(i) = 10;
end
end
subplot(4,1,3)
plot(t,modulatedsignal);
axis([-tmin-0.05 tmax+0.05 -1 2*Ac+1]);
xlabel('Time(sec)');
ylabel('Amplitude(volts)');
title('Modulated Signal');