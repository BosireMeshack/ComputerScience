clear

px = [-2 6 10];
py = [-2 -2 2];

v = [6 -4];

plot(px, py, '*', 'Color','b');
hold on
quiver(px(1), py(1), v(1), v(2));
axis equal

ax = gca;
ax.XAxisLocation = 'origin';

t1 = 0; t2 = 1; t3 = 1.5; 

syms t a3 a2 a1 a0 b3 b2 b1 b0 
x(t) = a3*t^3 + a2*t^2 + a1*t + a0;
xd(t) = diff(x,t);

e = [x(t1) == px(1), x(t2)==px(2), x(t3)==px(3), xd(t1) == v(1)];
m = solve(e, [a3 a2 a1 a0]);
cx(t) = subs(x, [a3 a2 a1 a0], [m.a3 m.a2 m.a1 m.a0]);

y(t) = b3*t^3 +b2*t^2 +b1*t + b0;
yd(t) = diff(y,t);
e = [y(t1) == py(1), y(t2) == py(2), y(t3) == py(3), yd(t1) == v(2)];
m = solve(e, [b3 b2 b1 b0]);
cy(t) = subs(y, [b3 b2 b1 b0], [m.b3 m.b2 m.b1 m.b0]);
fplot(cx, cy, [t1 t3],'Color','k');

% at t = 2

P = [cx(1) cy(1)];
qx = diff(cx,t);
qy = diff(cy,t);

plot(P(1), P(2), '.', 'MarkerSize', 20);
quiver(P(1), P(2), qx(1), qy(1));
