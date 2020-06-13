G=tf([1],[7371/1250000000000 83/1000000 1]);
Gd=c2d(G,1/44100,'tustin');
freqs([7371/1250000000000 83/1000000 1],[1],2000)
figure
freqs([1 -1.656 0.7298],[0.01845 0.0369 0.01845])
%options = bodeoptions;
%options.FreqUnits = 'Hz';
bode(G,Gd,{1000 100000},options)
