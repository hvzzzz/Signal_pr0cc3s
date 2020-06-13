%%
in=[];out=[];%vectores para almacenar las salidas y entradas
%Coeficientes del filtro
sos=[1  2  1  1  -1.956188183609503861148937176039908081293  0.984138845221757208037161035463213920593;1  2  1  1  -1.941861945163668723424166273616719990969  0.957121195896209031594992211466887965798;1  2  1  1  -1.938855655121078047642413366702385246754  0.941703247448826830101609175471821799874];
[B,A]=sos2tf(sos)
N=length(A);
%Frecuencia de muestreo
fs=44100;
%Frecuencia de se?al de entrada
count=1;%indice del vector de salida y entrada
%fval=1700:50:2300;
fval=0:100:10000;
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
        y(i)=-y(i-1)*A(2)-y(i-2)*A(3)-y(i-3)*A(4)-y(i-4)*A(5)-y(i-5)*A(6)-y(i-6)*A(7)+x(i)*B(1)+x(i-1)*B(2)+x(i-2)*B(3)+x(i-3)*B(4)+x(i-4)*B(5)+x(i-5)*B(6)+x(i-6)*B(7);
    end
    in(count)=max(x);
    out(count)=max(y);
    count=count+1;
end
out=20*log10(out);%convertir las salidas a Db
%loglog(fval,out)
figure(1)
plot(fval,out);
xlabel("Hz")
ylabel("Vo(Db)")


