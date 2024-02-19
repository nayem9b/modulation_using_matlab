%plotting the modulating signal
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
%pulse train
fc = 25;
Ac = 1;
carrierpulses = Ac*square(2*pi*fc*t)+Ac;
%adding the 'Ac' makes double side pulse train to one side pluse train.
subplot(4,1,2)
plot(t,carrierpulses);
axis([-tmin-0.05 tmax+0.05 -1 2*Ac+1]);
xlabel('Time(sec)');
ylabel('Amplitude(volts)');
title('Pulse Train');
%natural top double side modulation
doublesidebandnaturaltopmodulatedsignal = modulatingsignal.*carrierpulses;
subplot(4,1,3)
plot(t,doublesidebandnaturaltopmodulatedsignal);
axis([-tmin-0.05 tmax+0.05 -2*Ac*Am-1 2*Ac*Am+1]);
%axis([-tmin-0.05 tmax+0.05 -1 2*Ac+1]);
xlabel('Time(sec)');
ylabel('Amplitude(volts)');
title('Double side band natural top modulatedsignal');