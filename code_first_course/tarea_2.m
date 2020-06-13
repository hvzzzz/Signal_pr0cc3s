h=tf([1 2],[1 4 3]);
h_n=c2d(h,0.1,'impulse');
%damos un titulo al subgrafico
subplot(2,1,1);%indicamos la posicion del segundo subgrafico
impulse(h);%graficamos los valores discretos contenidos en 'n' y 'y'
title('Respuesta al impulso(Continuo)');
%damos titulo al grafico
subplot(2,1,2)
impulse(h_n)
title('Respuesta al impulso(Discreto)');
