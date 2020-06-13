
%Procesamiento de Señales 2 - Primavera 2020

%Equipo 2:
%Quispe Condori Hanan Ronaldo
%Niño García Erick Sandro
%Vega Aguilar Carlos Alfredo

%Ventana Blackman. Fc=440Hz
%DeltaF = Fc/Fm = 440/44100 = 0.0099
%N = 5.5/DeltaF = 5.5/0.0099 = 555

%Coeficientes del filtro
A=[ ...
    ...];

%Determinar orden del filtro
A=A';
N=length(A);

%Frecuencia de muestreo
fs=44100;

%Frecuencia de señal de entrada
fi=440;

%Generar vector de tiempo discreto
t=0:(1/fs):0.05;
T=length(t)
n=0:1:T;

%Señal de entrada TD
x=sin(2*pi*(fi/fs)*n);

%Generar vector de salida
y=zeros(1,T+1);

%Calculo de la salida
for i=(N+1):T
    
    %Muestra actual
    y(i)=A(1)*x(i);
    
    %Muestras anteriores
    for k=2:N
        y(i)=y(i)+x(i-k)*A(k);
    end

end

%Graficas salida
subplot(2,1,1)
stem(n,x)
subplot(2,1,2)
stem(n,y)


