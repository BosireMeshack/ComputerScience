clear

syms t

x(t) = t* cos(t);
y(t) = t*sin(t);
z(t) = t;
fplot3(x, y, z, [0 10*pi]);
axis equal;
xlabel('x'); ylabel('y'); zlabel('z');
t0=25;
P = [x(t0), y(t0), z(t0)];
hold on;
plot3(P(1), P(2), P(3), ".m","MarkerSize",20)
xd(t) = diff(x,t);
yd(t) = diff(y,t);
zd(t) = diff(z,t);
v = [xd(t0), yd(t0), zd(t0)];
quiver3(P(1),P(2),P(3),v(1),v(2),v(3), "LineWidth", 2);
