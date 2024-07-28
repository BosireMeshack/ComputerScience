clear
px = [3 -1 1 4];
py = [5 3 1 3];
axis([-4 5 -4 6]);
plot(px, py, '*', 'Color','r');
axis equal
hold on
t1 = -1 ; t2 = 1; t3 = 3; t4 = 4;
syms t a3 a2 a1 a0 b3 b2 b1 b0

x(t) = a3*t^3 + a2*t^2 + a1*t + a0;

e = [x(t1) == px(1), x(t2)==px(2), x(t3)==px(3),x(t4) == px(4)];

m = solve(e, [a3 a2 a1 a0]);

cx(t) = subs(x, [a3 a2 a1 a0], [m.a3 m.a2 m.a1 m.a0]);

y(t) = b3*t^3 +b2*t^2 +b1*t + b0;
e = [y(t1) == py(1), y(t2) == py(2), y(t3) == py(3), y(t4) == py(4)];
m = solve(e, [b3 b2 b1 b0]);
cy(t) = subs(y, [b3 b2 b1 b0], [m.b3 m.b2 m.b1 m.b0]);
fplot(cx, cy, [t1 t4],'Color','k');

legend('Control points', 'Hermite curve');