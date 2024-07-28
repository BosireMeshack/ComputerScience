clear
syms t
x(t) = t*cos(t); 
y(t) = t*sin(t);
fplot(x,y,[0 20*pi], 'LineWidth', 4);
axis equal;
ax  = gca;
ax.XAxisLocation = "origin";
ax.YAxisLocation = "origin";
hold on
t0 = 25;
P = [x(t0) , y(t0)];
plot(P(1), P(2), '.k', "MarkerSize", 20);
xd(t) = diff(x, t);
yd(t) = diff(y, t);
v = [xd(t0), yd(t0)];
quiver(P(1), P(2), v(1), v(2),'.g', 'LineWidth', 1.5);