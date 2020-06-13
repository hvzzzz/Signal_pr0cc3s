function [XK] = midft(xn,F,N)


Wn=exp(-1i*2*pi*(1/N));% El famoso  twiddle factor que es generador de la matriz  twiddle 
WN=zeros(N,N); % definición de la matriz  twiddle 

for k=1:N     %Todo el proceso para generar la matriz  twiddle 
    for n=1:N
        WN(n,k)=Wn^((n-1)*(k-1));
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

XK=zeros(F,N); %definición de la matriz donde se guardaran los valores de la DFT


for f=1:F  
    XK(f,1:end)=xn(1,1+(f-1)*N:f*N)*WN; % en esta línea se hace el proceso de la DFT xD
end

