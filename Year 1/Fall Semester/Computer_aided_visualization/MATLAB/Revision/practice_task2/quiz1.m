syms u v
% paramteric Surface
x(u,v) = u - u^3/3 + u*v^2;
y(u,v) = v - v^3/3 +u*v^2;
z(u,v) = u^2 -v^2;

fsurf(x,y,z ,[-25 25 -25 25]);

P = [x(10, 15) y(10, 15) z(10, 15)];

hold on
u0=10;
v0=15;
plot3(P(1), P(2),P(3),'*');