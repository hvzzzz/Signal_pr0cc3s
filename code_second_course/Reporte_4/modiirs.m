%% Comparacion filtro Anal�gico vs filtro Digital
G=tf([1],[7371/1250000000000 83/1000000 1]);% funcion de transferencia de en tiempo continuo
Gd=c2d(G,1/44100,'tustin');%uso de la transformacion bilineal 
options = bodeoptions;
options.FreqUnits = 'Hz';
figure(1)
bode(G,Gd,{1000 100000},options);%comparacion de respuestas de sistemas en tiempo continuo y discreto
%% Codigo FIR modificado para simulaci�n en el dominio del tiempo
in=[];out=[];%vectores para almacenar las salidas y entradas
%Coeficientes del filtro
A=[0.01845 0.0369 0.01845];
B=[1.656 -0.7298];
N=length(A);
%Frecuencia de muestreo
fs=44100;
%Frecuencia de se?al de entrada
fi=2000;
%Generar vector de tiempo discreto
t=0:(1/fs):0.05+1/fs;
T=length(t)
n=0:T;
%Se�al de entrada TD
x=sin(2*pi*(fi/fs)*n);
%Generar vector de salida
y=zeros(1,T+1);
%Calculo de la salida
for i=(N):T
    y(i)=y(i-1)*B(1)+y(i-2)*B(2)+x(i)*A(1)+x(i-1)*A(2)+x(i-2)*A(3);
end
%Graficas salida
figure(2)
subplot(2,1,1)
stem(t,x(1:length(t)))
ylabel("Entrada")
title("Simulaci�n en el Dominio del Tiempo")
xlabel("Tiempo[seg]")
subplot(2,1,2)
stem(t,y(1:length(t)))
ylabel("Salida")
xlabel("Tiempo[seg]")


