clear

syms x y z
F(x,y,z) = x^2 + y^2 + z^2 -1 ;
fimplicit3(F, [0 2 -2 2 -2 2]);
xlabel('x'); ylabel('y')
axis equal;