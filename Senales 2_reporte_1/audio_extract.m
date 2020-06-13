clc;clear all; close all;
%%extraccion de audio
filename='3.wav';
[y,Fs] = audioread(filename);
info = audioinfo(filename);
t = 0:seconds(1/Fs):seconds(info.Duration); t = t(1:end-1);
plot(t,y(:,1)); xlabel('Time'); ylabel('Audio Signal')
%%extraccion de las muestras
muestras=y(:,1);
muestras1=muestras(3414:3507);
length(muestras1);
a=max(muestras1);
factor=2^(15)/abs(max(muestras1));
muestras1=muestras1*factor;
muestras1=round(muestras1);
plot(1:length(muestras1),muestras1)