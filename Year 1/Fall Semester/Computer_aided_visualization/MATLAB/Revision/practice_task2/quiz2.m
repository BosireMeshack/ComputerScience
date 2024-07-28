syms x y

z(x,y) = (1-x^2-0.5*y^2)^(1/2);

fsurf(z);
xlabel('x'); ylabel('y'); zlabel('z');

hold on
u0 = 0.5;
v0 = 0.2;
P = [u0, v0, z(u0,v0)];
plot3(P(1), P(2), P(3), '*', 'color', 'b', 'MarkerSize',20);

axis equal