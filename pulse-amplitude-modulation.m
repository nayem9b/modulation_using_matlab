clc;
clear all;
close all;
Am=1;
fm=2;
phim=0;
tmin=0;
tmax=2;
samplingrate=1000;
t= tmin:1/samplingrate:tmax;
modulatingsignal=Am*cos(2*pi*fm*t + phim);
subplot(4,1,1);
plot(t,modulatingsignal);
xlabel('Time(sec)');
ylabel('Amplitude(V)');
title('Modulating Signal');
%carrier signal
fc=25;
Ac=1;
carrierpulses=Ac*square(2*pi*fc*t)+Ac;
subplot(4,1,2);
plot(t,carrierpulses);
axis([-tmin-0.01 tmax+0.01 -Ac-1 2*Ac+1]);
title('Carrier Pulses');
xlabel('Time(sec)');
ylabel('Amplitude(V)');
%double sideband signal
doublesidebandmodulatedsignal=modulatingsignal.*carrierpulses;
subplot(4,1,3);
plot(t,doublesidebandmodulatedsignal);
xlabel('Time(sec)');
ylabel('Amplitude(V)');
title('DSB signal');
%single sideband signal
singlesidebandmodulatedsignal=[];
for i=1:1:length(doublesidebandmodulatedsignal);
if doublesidebandmodulatedsignal(i)==0;
    singlesidebandmodulatedsignal=[singlesidebandmodulatedsignal,doublesidebandmodulated
signal(i)];
else
singlesidebandmodulatedsignal=[singlesidebandmodulatedsignal,doublesidebandmodulated
signal(i)+3*Ac*Am];
end
end
subplot(4,1,4);
plot(t, singlesidebandmodulatedsignal);
xlabel('Time(sec)');
ylabel('Amplitude(V)');
title('SSB Signal');