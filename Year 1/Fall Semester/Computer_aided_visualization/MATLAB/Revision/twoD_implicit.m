clear
syms x y

F(x,y) = x^2 + y^2 - 1;
fimplicit(F, [-2 2 -2 2], 'g', 'LineWidth',2)
axis equal
x0 = 1;
y0 = 1;
F(3,1)
P = [x0 , y0 ,F(x0,1)];
hold on;
plot(P(1),P(2), "*",  "MarkerSize", 20);
