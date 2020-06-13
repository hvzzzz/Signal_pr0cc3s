function [XK] = mifft(xn,F,N)


Wn=exp(-1i*2*pi*(1/N));% El famoso  twiddle factor que es generador de la matriz  twiddle 


if rem(N,2)==1 %Para N impar
    WN=zeros(N,(N+1)/2); % definición de la matriz  twiddle 
    
    for n=1:N
            WN(n,1)=1;
    end
    
    for k=2:(N+1)/2     %Todo el proceso para generar la matriz  twiddle 
        for n=1:N
            WN(n,k)=Wn^((n-1)*(k-1));
        end
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    XK=zeros(F,(N+1)/2); %definición de la matriz donde se guardaran los valores de la DFT


    for f=1:F  
         XK(f,1:end)=xn(1,1+(f-1)*N:f*N)*WN; % en esta línea se hace el proceso de la DFT xD
    end

    XK1=conj(XK(1:F,2:end)); %Se usa la propiedad X(K)=X*(N-K) para optimizar el algoritmo (Donde X(K) es la DFT)
    XK1=fliplr(XK1);
    XK=[XK,XK1];
    
else    %Para N par
     
    WN=zeros(N,(N+2)/2); % definición de la matriz  twiddle 
    
    for n=1:N
            WN(n,1)=1;
    end
    
    for k=2:(N+2)/2     %Todo el proceso para generar la matriz  twiddle 
        for n=1:N
            WN(n,k)=Wn^((n-1)*(k-1));
        end
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    XK=zeros(F,(N+2)/2); %definición de la matriz donde se guardaran los valores de la DFT


    for f=1:F  
         XK(f,1:end)=xn(1,1+(f-1)*N:f*N)*WN; % en esta línea se hace el proceso de la DFT xD
    end

    XK1=conj(XK(1:F,2:end-1));%Se usa la propiedad X(K)=X*(N-K) para optimizar el algoritmo (Donde X(K) es la DFT)
    XK1=fliplr(XK1);
    XK=[XK,XK1];
end 



