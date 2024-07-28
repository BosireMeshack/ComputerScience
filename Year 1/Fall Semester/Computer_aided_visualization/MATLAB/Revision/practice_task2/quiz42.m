clear
syms x y z

F(x,y,z) = x - 2*y+3*z-4;

fimplicit3(F,'g');
axis equal