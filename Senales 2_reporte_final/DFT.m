            %Ajuste de variables

V=1;%fila de la matriz de fourier que se graficará (ver graficación)
N=10; %DFT de N-puntos
comp=0;% 1 para activar el complemento de ceros, 0 en caso contrario
C=28;  %cantidad de ceros para complementar

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

              %SEÑALES A LAS QUE SE LES APLICARÁ LA FFT O DFT

%NOTA: Para elegir un determinado tipo de señal se debe de descomentar el
%código respecto a la señal deseada. SOLO SE DEBE DESCOMENTAR UN CÓDIGO
%A LA VEZ.
                            %Archivo de Audio

% [s,fs]=audioread('audio2.mp4'); %Código para leer audio externo
% info=audioinfo('audio2.mp4');
% xn=transpose(s);
% x=0:length(xn)-1;

                                
                            %ONDA SENO
% nf=1000;     %cantidad de muestras                     
% fi=11025;    %frecuencia
% fs=44100;    %frecuencia de muestreo
% x=0:1:nf;
% xn=sin(2*pi*(fi/fs)*x)+1;
xn=[5 -59 45 1 0 2 2 3 -6 1];

                            %ONDA CUADRADA
% fi=4410; $frecuencia
% fs=44100; $frecuencia de muestreo
% tf=1; %tiempo final
% ti=0; $tiempo inicial
% xn = cuadrada(ti,tf,fi,fs);
% x=0:length(xn)-1;                            

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

F = bloques(xn,N); %cantidad de bloques de N-puntos en la señal

if comp==1         %complemento de ceros
    xn1=zeros(1,N*F);
    for k=1:F
        xn1(1+(k-1)*N:N*k)=[xn(1+(k-1)*(N-C):(N-C)*k),zeros(1,C)];
    end
    xn=xn1;
    x=0:length(xn)-1;
end    


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                            %miDFT
tic
XK = midft(xn,F,N); %Algoritmo de DFT
toc

tic
XK2 = mifft(xn,F,N); %Algoritmo de FFT propuesto
toc


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                              % FFT de MATLAB
tic
XK1=zeros(F,N);%definición de la matriz donde se guardaran los valores de la FFT
for f=1:F
    XK1(f,1:N)=xn(1+(f-1)*N:N*f);
end


XK1=fft(XK1,[],2);%en esta línea se hace el proceso de la FFT
toc

%NOTA:
%Una fila de la matriz XK guarda los valores de la DFT aplicada a un bloque
%de toda la señal. Entonces si quiero saber la DFT de el bloque 3 de mi
%señal, tendré que consultar la fila 3 de la matriz XK. (Lo aplica para la
%matriz XK1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                               %Graficación

P2 = abs (XK2/N);%coeficientes de serie de fourier (XK para coeficientes de mi dft, XK1 para coeficientes de la fft de matlab
% y XK2 para coeficientes de mifft
w=0:(2*pi)/N:2*pi-((2*pi)/N);
w=w*fs*(1/(2*pi));%eje de frecuencia continua
if rem(N,2)==1 %Para N impar
    N1=N-1;
    P1 = P2(1:end,1:(N1/2)+1); 
    P1(1:end,2:end) = 2*P1(1:end,2:end);
    w=w(1:(N+1)/2);
else
    N1=N; %Para N par
    P1 = P2(1:end,1:(N1/2)+1); 
    P1(1:end,2:end-1) = 2*P1(1:end,2:end-1);
    w=w(1:(N/2)+1);
end

%NOTA: Para graficar se tienen 3 opciones separadas por %%%%%%%%%%%%%%%%%
%SE DEBE DE DESCOMENTAR UNA SOLA OPCIÓN A LA VEZ para observar la gráfica
%resultante

%%%%%%%%%%%%%%%%%%%%%%%
 
                             %Gráficación de el bloque V de N-puntos de la
                             %señal (la variable V se elige al principio)

%      subplot(2,1,1)
%      stem(w,P1(V,1:end)) 
%      title( 'Amplitud de espectro x(t)' ) 
%      xlabel ( 'f (Hz)' ) 
%      ylabel ( '| X (f)|' )
%      subplot(2,1,2)
%      stem(x(1+(V-1)*N:N*V),xn(1+(V-1)*N:N*V))
%      ylabel ('señal')
%%%%%%%%%%%%%%%%%%%%%%%

                %Grafiación de todo el espectro de la señal

% for k=1:F
%      subplot(2,1,1)
%      stem(w,P1(k,1:end)) 
%      title( 'Amplitud de espectro x(t)' ) 
%      xlabel ( 'f (Hz)' ) 
%      ylabel ( '| X (f)|' )
%      subplot(2,1,2)
%      stem(x(1+(k-1)*N:N*k),xn(1+(k-1)*N:N*k))
%      ylabel('señal')
%      pause(1); %tiempo en segundos para una pausa
%  end    

%%%%%%%%%%%%%%%%%%%%%%%

                    %Graficación para comparar la magnitud de los
                    %coeficientes de la FFT de matlab y la FFT propuesta

w=0:(2*pi)/N:2*pi-((2*pi)/N);
subplot(2,1,1)
stem(w/(2*pi),abs(XK2(V,1:end)))
ylabel('Mi FFT')
xlabel('frecuencia discreta normalizada')
subplot(2,1,2)
stem(w/(2*pi),abs(XK1(V,1:end)))
xlabel('frecuencia discreta normalizada')
ylabel('FFT de Matlab')


