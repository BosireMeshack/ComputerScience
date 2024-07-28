clear
syms  u v
m = 5;
x(u,v) = cos(u);
y(u,v) = sin(u);
z(u,v) = v;
fsurf(x,y,z, [0 2*pi 0 m]);
axis equal;
xlabel('x'); ylabel('y'); zlabel('z');
u0 = 1;
v0 = 3;
hold on

xd(u,v) = diff(x,u,v)
yd(u,v) = diff(y,u,v)
zd(u,v) = diff(z,u,v)
v = [xd(u0,v0), yd(u0,v0), zd(u0,v0)]
quiver3(x(u0,v0),y(u0,v0), z(u0,v0),v(1),v(2),v(3),'LineWidth',3);