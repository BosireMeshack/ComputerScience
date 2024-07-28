% parametric curves
syms t
x(t) = t * cos(t);
y(t) = t * sin(t);
z(t) = t;
% %special curve
fplot3(x,y,z,[0 12*pi]);
xlabel('x'); ylabel('y'); zlabel('z');

axis equal 
% % 
t0 = 25;
P = [x(t0), y(t0), z(t0)];
hold on
plot3(P(1), P(2),P(3),'.k', 'MarkerSize', 13) % .k is for color black
% 