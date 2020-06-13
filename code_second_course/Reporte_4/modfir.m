%%
G=tf([1],[7371/1250000000000 83/1000000 1]);% funcion de transferencia de en tiempo continuo
Gd=c2d(G,1/44100,'tustin');%uso de la transformacion bilineal 
options = bodeoptions;
options.FreqUnits = 'Hz';
figure(1)
bode(G,Gd,{1000 100000},options);%comparacion de respuestas de sistemas en tiempo continuo y discreto
%%
in=[];out=[];%vectores para almacenar las salidas y entradas
%Coeficientes del filtro
A=[0.01845 0.0369 0.01845];
B=[1.656 -0.7298];
N=length(A);
%Frecuencia de muestreo
fs=44100;
%Frecuencia de se?al de entrada
count=1;%indice del vector de salida y entrada
fval=1700:50:2300;
%fval=0:100:10000;
for ii=fval%variando la frecuencia de entrada dentro del rengo solicitado
    fi=ii;
    %Generar vector de tiempo discreto
    t=0:(1/fs):0.05;
    T=length(t)
    n=0:T;
    %Se?al de entrada TD
    x=sin(2*pi*(fi/fs)*n);
    %Generar vector de salida
    y=zeros(1,T+1);
    %Calculo de la salida
    for i=(N):T
        y(i)=y(i-1)*B(1)+y(i-2)*B(2)+x(i)*A(1)+x(i-1)*A(2)+x(i-2)*A(3);
    end
    in(count)=max(x);
    out(count)=max(y);
    count=count+1;
end
out=20*log10(out);%convertir las salidas a Db
%loglog(fval,out)
figure(2)
plot(fval,out);
xlabel("[Hz]")
ylabel("Vo[Db]")


