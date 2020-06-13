%% Codigo FIR modificado para simulación en el dominio del tiempo
in=[];out=[];%vectores para almacenar las salidas y entradas
%Coeficientes del filtro
sos=[1  2  1  1  -1.956188183609503861148937176039908081293  0.984138845221757208037161035463213920593;1  2  1  1  -1.941861945163668723424166273616719990969  0.957121195896209031594992211466887965798;1  2  1  1  -1.938855655121078047642413366702385246754  0.941703247448826830101609175471821799874];
[B,A]=sos2tf(sos)
%A=[0.01845 0.0369 0.01845];
%B=[1.656 -0.7298];
N=length(A);
%Frecuencia de muestreo
fs=44100;
%Frecuencia de se?al de entrada
fi=1900;
%Generar vector de tiempo discreto
t=0:(1/fs):0.05+1/fs;
T=length(t)
n=0:T;
%Señal de entrada TD
x=sin(2*pi*(fi/fs)*n);
%Generar vector de salida
y=zeros(1,T+1);
%Calculo de la salida
for i=(N):T
    y(i)=-y(i-1)*A(2)-y(i-2)*A(3)-y(i-3)*A(4)-y(i-4)*A(5)-y(i-5)*A(6)-y(i-6)*A(7)+x(i)*B(1)+x(i-1)*B(2)+x(i-2)*B(3)+x(i-3)*B(4)+x(i-4)*B(5)+x(i-5)*B(6)+x(i-6)*B(7);
end
%Graficas salida
figure(2)
subplot(2,1,1)
stem(t,x(1:length(t)))
ylabel("Entrada")
title("Simulación en el Dominio del Tiempo")
xlabel("Tiempo[seg]")
subplot(2,1,2)
stem(t,y(1:length(t)))
ylabel("Salida")
xlabel("Tiempo[seg]")