%Grafica de Senoidales Periodica y no Periodica
clc;
clear all;
close all;
n=0:1:100;
y1=sin(0.25*pi*n);
y2=sin(0.25*3.14*n);
subplot(2,1,1);
stem(n,y1);
subplot(2,1,2);
stem(n,y2);

