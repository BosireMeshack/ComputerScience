clear
syms x

f(x) = sin(x);
axis([-30 10 -4 4]);
fplot(f, [-2*pi 2*pi]);
% axis equal;
ax = gca;
ax.XAxisLocation = "origin";
ax.YAxisLocation = "origin";
g(x) = cos(x);
hold on
fplot(g,[-2*pi 2*pi], 'm');
% x0 = -10;
% P = [x0, f(x0)];
% double(P(2));
% plot(P(1),P(2), '*', "MarkerSize", 20);
