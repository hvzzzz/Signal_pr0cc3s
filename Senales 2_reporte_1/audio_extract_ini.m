%Extraccion de muestras de archivo wav
clc;clear all; close all;
filename='3.wav';
[y,Fs] = audioread(filename);
info = audioinfo(filename);
t = 0:seconds(1/Fs):seconds(info.Duration); t = t(1:end-1);
plot(t,y(:,1)); xlabel('Time'); ylabel('Audio Signal')