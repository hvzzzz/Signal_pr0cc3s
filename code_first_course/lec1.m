%matlab notes
%p=[3 0 5 3 2 10]
%roots(p)//raices
%polyval(p,pi)//evaluacion del polinomio p en pi
%practice script
t=1:0.1:15;
v=zeros(length(t));
for i=t
    if(t(i)>3)
        v(i)=4;
    end
end
plot(t,v);