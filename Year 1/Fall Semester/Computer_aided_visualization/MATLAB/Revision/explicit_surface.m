clear

syms x y
f(x,y) = sin(x) + cos(y);
fsurf(f);
axis([-4*pi 4*pi 0 5]);
xlabel('x'); ylabel("y");zlabel('z');
axis equal
x0 = 2; 
y0 = 3;
P = [x0, y0, f(x0,y0)];
figure
plot3(P(1), P(2), P(3),"*");

