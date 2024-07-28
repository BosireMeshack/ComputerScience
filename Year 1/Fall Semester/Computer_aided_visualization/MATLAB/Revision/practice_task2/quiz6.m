clear
px=[10,20,40,50,20];
py=[20,40,40,20,10];
plot(px,py,'*')
axis equal; hold on;
syms a4 a3 a2 a1 a0 b4 b3 b2 b1 b0 t
x(t)=a4*t^4+a3*t^3+a2*t^2+a1*t+a0;
y(t)=b4*t^4+b3*t^3+b2*t^2+b1*t+b0;
t0=0; t1=1; t2=2; t3=3; t4=4;
e=[x(t0)==px(1),...
    x(t1)==px(2),...
    x(t2)==px(3),...
    x(t3)==px(4),...
    x(t4)==px(5)]
s=solve(e,[a4 a3 a2 a1 a0])
hx=subs(x,[a4 a3 a2 a1 a0],[s.a4 s.a3 s.a2 s.a1 s.a0])
e=[y(t0)==py(1),...
    y(t1)==py(2),...
    y(t2)==py(3),...
    y(t3)==py(4),...
    y(t4)==py(5)]
s=solve(e,[b4 b3 b2 b1 b0])
hy=subs(y,[b4 b3 b2 b1 b0],[s.b4 s.b3 s.b2 s.b1 s.b0])
fplot(hx,hy,[t0 t4])
%when t=0.5
t5=0.5;
dx=diff(hx,t); dy=diff(hy,t);
qx=[hx(t5)]; qy=[hy(t5)];
plot(qx,qy,'.','MarkerSize',20)
quiver(qx,qy,dx(t5),dy(t5))