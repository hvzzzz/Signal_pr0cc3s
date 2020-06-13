%Sampling
T=0.5;
t=-10:0.1:10;
f=sin(t);
deltas=0.0;
for i=min(t):max(t)
    deltas=deltas+sinc(10*(t-T*i));%generacion del tren de impulsos
end
subplot(3,1,1);
plot(t,f);
subplot(3,1,2);
plot(t,deltas);
muestreo=f.*deltas;%multiplicación del tren de impulsos por la señal
subplot(3,1,3);
plot(t,muestreo);
