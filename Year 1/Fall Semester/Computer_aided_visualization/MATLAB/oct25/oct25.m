clear
% px = [-2 3 7 10];
% py = [1 7 2 -2];
% plot(px, py, '.r-', 'MarkerSize', 30)
% axis([-4 12 -4 10])
% axissetting %used to show graphs on different windows
% hold on

% sets symbolic variables
% syms x
% f(x) = x^2+3*x - 1 ;
% fplot(f,[-2 10]);
% x0 = -2;
% P = [x0, f(x0)];
% double(P(2)); %used to show the value on the command window
% figure
clear
% 
% %implicit equations
% 
% syms x y
% F(x,y)= x^2 -y^2; %x^2 -y^2 = 0
% fimplicit(F ,[ 0 100 -100 100])
% xlabel("xaxis")
% ylabel("yaxis")
% axis equal
% % 
% F(2,1)
% % clear
% 

% %Tangent vector
% 
% % xd(t) = diff(x,t);
% % yd(t) = diff(y,t);
% % zd(t) = diff(z,t);
% % v = [xd(t0), yd(t0), zd(t0)];
% % quiver3(P(1),P(2),P(3),v(1),v(2), v(3))
% 
% %special curves
% 
% % plot3
% % quiver3
% % 3 arguments for each function
% 
% %xmas tree
% 
% % clear
% % 
% % syms x y
% % f(x,y) = sin(x) + cos(y);
% % fsurf(f, [-5 8 0 10]); %restricts domain
% % axis equal
% 
% % Plotting a point
% x0 = 2; y0 = 4;
% P = [x0, y0, f(x0,y0)];
% hold on
% plot3(P(1),P(2),P(3),'.r', 'MarkerSize', 15)
% 
% fimplicit(f, 'r', "LineWidth", 4)
% 
% clear
% 
% 
