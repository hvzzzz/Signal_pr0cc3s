%%
%Funcion Escalon Unitario
n=-100:100;%creacion del vector de elementos igualmente espaciados desde el valor -100 a 100, que sera la cantidad de muestras usadas 
h2=zeros(length(n),1);%vector columna que contiene unicamente ceros de orden 201,1
h2(101:201)=1;%los elementos apartir de la posicion 101 hasta el final del vector tomaran el valor de 1  
figure('Name','Escalon Unitario')%creamos una nueva figura que se llamara Escalon Unitario 
stem(n,h2);%esta funcion nos permite graficar datos discretos, en este caso graficaremos los vectores n y h2
xlabel('Muestras')%le ponemos nombre al eje de las x
title('Escalon Unitario')%le ponemos un titulo al grafico
%%
%Funcion Impulso Unitario
n=-100:100;%creacion del vector de elementos igualmente espaciados desde el valor -100 a 100, que sera la cantidad de muestras usadas 
h2=zeros(length(n),1);%vector columna que contiene unicamente ceros de orden 201,1
h2(101)=1;%el elemento en la posicion 101 de h2 tomara el valor de 1 
figure('Name','Impulso Unitario')%creamos una nueva figura que se llamara Impulso Unitario 
stem(n,h2);%esta funcion nos permite graficar datos discretos, en este caso graficaremos los vectores n y h2
xlabel('Muestras')%le ponemos nombre al eje de las x
title('Escalon Unitario')%le ponemos un titulo al grafico
%%
%Secuencia Senoidal
n=-100:100;%creacion del vector de elementos igualmente espaciados desde el valor -100 a 100, que sera la cantidad de muestras usadas 
A=1;%definimos la amplitud de la se�al 
w=pi/8;%definimos la velocidad angular de la se�al
x=A*cos(w*n);%pasamos el vector n a la funcion cos() y almacenamos en la variable x los nuevos valores
figure('Name','Secuencia Sinusoidal')%creamos una nueva figura que se llamara Secuencia Sinusoidal 
stem(n,x);%esta funcion nos permite graficar datos discretos, en este caso graficaremos los vectores n y x
xlabel('Muestras');%le ponemos nombre al eje de las x
ylabel('Amplitud');%le ponemos nombre al eje de las y
title('Secuencia Sinusoidal')%le ponemos un titulo al grafico
%%
%Retardo ideal del escalon unitario
n=-100:100;%creacion del vector de elementos igualmente espaciados desde el valor -100 a 100, que sera la cantidad de muestras usadas 
nd=10;%este el valor de retardo de la funcion
h2=zeros(length(n),1);%vector columna que contiene unicamente ceros de orden 201,1
h2(n>=nd)=1;%indicamos que todos los valores mayores al retardo sean 1
figure('Name','Retardo Ideal')%creamos una nueva figura que se llamara Retardo Ideal 
stem(n,h2);%esta funcion nos permite graficar datos discretos, en este caso graficaremos los vectores n y h2
xlabel('Muestras');%le ponemos nombre al eje de las x
title('Escalon Unitario')%le ponemos un titulo al grafico
%%
%Ecuaciones en diferencia
N=30;%definimos el numero de muestras a utilizar 
n=0:N-1;%creamos un vector del mismo tama�o del numero de muestra a utilizar
x=ones(N,1);%cremos una matriz columna de 30x1 conteniendo puros 1
y=zeros(N,1);%cremos una matriz columna de 30x1 conteniendo puros 0
y(1)=x(1);%damos valor inicial a la salida de 1
for i=1:N-1%bucle iterativo que actualizara la cada valor de y en funcion de su valor previo sumado con una constante 
    y(i+1)= x(i+1)+(0.5)*y(i);
end
figure(1);%creacion de la figura
subplot(2,1,1);%indicamos la posicion de la figura
stem(n,x);%graficamos los valores discretos contenidos en 'n' y 'x'
title('Entrada');%damos un titulo al subgrafico
subplot(2,1,2);%indicamos la posicion del segundo subgrafico
stem(n,y);%graficamos los valores discretos contenidos en 'n' y 'y'
title('Respuesta al Escalon');%damos titulo al grafico

%%
%Respuesta al Impulso del sistema 
n=0:100;%generamos un vector de tamaño 101 con valores ascendentes  
x=(0.5).^n;%pasamos el vector de tamaño ascendente a la funcion exponencial
stem(n,x);%graficamos los valores discretos
xlabel('Muestras');%le ponemos nombre al eje de las x
ylabel('Inversa');%le ponemos nombre al eje de las y
title('Inverse')%le ponemos titulo al grafico
%%
