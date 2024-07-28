syms x y z 

F(x,y,z) = x + y - z;

fimplicit3(F,'r', 'LineWidth',1);
xlabel('x');ylabel('y');zlabel('z');
axis equal