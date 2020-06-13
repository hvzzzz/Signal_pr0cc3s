%Extraccion de las muestras
muestras=y(:,1);
muestras_periodo=muestras(3414:3507);
length(muestras_periodo);
a=max(muestras_periodo);
factor=2^(15)/abs(max(muestras_periodo));
muestras_periodo=muestras_periodo*factor;
muestras_periodo=round(muestras_periodo);
plot(1:length(muestras_periodo),muestras_periodo)