clc;
clear all;
close all;
%plotting the analog signal
v = 8;
f =2;
phi = 0;
maxtime = 1;
samplerate = 1000;
t = 0:1/(samplerate-1) : maxtime;
analogsignal = v*sin(2*pi*f*t+phi);
subplot(2,2,1);
plot(t, analogsignal);
title('Analog Signal');
axis([0, maxtime, -v-1, +v+1]);
xlabel('time(sec)');
ylabel('Amplitude');
%sampling process and plotting the sampled signal
samplingrate = 10*f;
dtime = 0: 1/samplingrate: maxtime;
sampledsignal = v*sin(2*pi*f*dtime+phi);
subplot(2,2,2);
stem(dtime, sampledsignal);
title('Sampled Signal');
axis([0, maxtime, -v-1, +v+1]);
xlabel('time(sec)');
ylabel('Amplitude');
%quantization of the sampled signal and plotting it
n = 8;
L = 2.*n;
vmin = -v;vmax = +v;
stepsize = (2*v)/L;
partition = vmin: stepsize: vmax;
codebook = vmin-(stepsize/2): stepsize: vmax+(stepsize/2);
[index,damplitude] = quantiz(sampledsignal,partition,codebook);
subplot(2,2,3);
stem(dtime, damplitude);
axis([0, maxtime, -v-1, +v+1]);
xlabel('time(sec)');
ylabel('Amplitude');
title('Quantized Signal');
%encoding process and the output is a matrix of 0's and 1's
codematrix = de2bi(index,'left-msb');
%making a vector form of the encoded matrix bit stream
[row,coloumn] = size(codematrix);
k=1;
for i=1:1:row
for j=1:1:coloumn
codevector(k) = codematrix(i,j);
k = k+1;
end
end
%plotting the digital signal
codevectorlength = length(codevector);
T = 0: maxtime/(codevectorlength-1): maxtime;
subplot(2,2,4);
stairs(T,codevector);
title('Digital Signal');
axis([0 maxtime -0.5 1.5]); xlabel('Time(sec)');