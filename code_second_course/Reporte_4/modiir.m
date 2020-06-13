%Coeficientes del filtro
A=[.01845              
   .0369
   .01845];
B=[-1.656
   .7298]; 
B1=1;
%Determinar orden del filtro
A=A';
B=B';
N=length(A);
M=length(B);

%Frecuencia de muestreo
fs=44100;
Ampout=zeros(1,101);
frec=zeros(1,101);
for f=1:101
%Frecuencia de señal de entrada
fi=100+100*(f-1);
frec(f)=fi;
%Generar vector de tiempo discreto
t=0:(1/fs):0.05;
T=length(t);
n=1:1:T;

%Señal de entrada TD
x=sin(2*pi*(fi/fs)*n);
x=[zeros(1,N),x];
%Generar vector de salida
y=zeros(1,T+M);
%Generar vectores de muestras iniciales
xp=zeros(1,N);
xp(1)=x(1);
yp=zeros(1,M);
lx=2;
ly=1;

%Calculo de la salida
for i=1:T-1
y(i+M)=(dot(xp,A)-dot(yp,B));
   for k=1:N
       xp(k)=x(k+lx);
   end
lx=lx+1;   
xp=fliplr(xp);
   for k=1:M
       yp(k)=y(k+ly);
   end
ly=ly+1;   
yp=fliplr(yp);   
%plot(1:1:T+M,y);
end
%plot(1:1:T+M,y);
Ampout(f)=max(y(100:end));
end
%Graficas salida
%Ampout=20*log10(Ampout)
loglog(frec,Ampout,'-s')
%subplot(2,1,1)
%stem(n,x(N+1:end))
%subplot(2,1,2)
%stem(n,y(M+1:end))