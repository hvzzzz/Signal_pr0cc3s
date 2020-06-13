t=-1:0.001:1;
f=sin(2*pi*20*t);
X=fft(f);%se usara la transformada rapida de Fourier
subplot(2,1,1);
plot(t,f);
subplot(2,1,2);
plot(t,abs(X));