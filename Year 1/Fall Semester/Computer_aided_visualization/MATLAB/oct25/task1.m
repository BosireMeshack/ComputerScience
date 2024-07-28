% fimplicit 

syms x y;
eq = x^2 + 5*x + y^3 - 5*x*y^2 - x + 1;
x_range=[-6,10];
fimplicit(eq,x_range,"Color",'blue');