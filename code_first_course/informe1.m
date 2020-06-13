%%
n=-100:100;
h2=zeros(length(n),1);
%h2(101:201)=1;
h1=zeros(length(n),1);
for i=n(1:100)
    h2(i)=(0.5)^i;
end
%figure()
stem(n,h2);
%%
n=-100:100;
h2=zeros(length(n),1);
h2(101)=1;
%figure()
stem(n,h2);
%%
w=pi/8;
n=-100:100;
x=cos(w*n)
%figure()
stem(n,x);
%%
n=-100:100;
nd=10
h2=zeros(length(n),1);
h2(n>=nd)=1;
%figure()
stem(n,h2);
%%
N=30;
n=0:N-1;
x=ones(N,1);
y=zeros(N,1);
y(1)=x(1);
figure
title('y_antes')
stem(n,y);
figure
title('x')
stem(n,x);
figure
title('y_final')
stem(n,y);
%%
N=30;n=0:N-1;
x=ones(N,1);

y=zeros(N,1);
y(1)=x(1);
figure
title('y_antes')
stem(n,y);
for i=1:N-1
    y(i)=1+0.5^i
end
figure
title('x')
stem(n,x);
figure
title('y_final')
stem(n,y);
