clear

% px = [1 4 6 8 9 13];
% py = [-1 5 5 -3 -4 1];
% plot(px, py, '*--')
% 
% axis equal
% 
% n = 5;
% 
% syms t
% cx(t) = 0*t;
% cy(t) = 0*t;
% for i = 0 : n
%     b(t) = nchoosek(n, i)*t^i * (1-t)^(n-i)
%     cx(t) = cx(t) + px(i+1)*b(t)
%     cy(t) = cy(t) + py(i+1)*b(t)
% end
% 
% hold on
% fplot(cx, cy, [0 1])
% 
% %Tangent vector
% ;
% 
% u = [n*(px(2)- px(1)),n*(py(2)-py(1))];
% 
% quiver(px(1), py(1) ,u(1), u(2))
% 
% v = [n*(px(6)- px(5)),n*(py(6)-py(5))];
% 
% quiver(px(6), py(5) ,v(1), v(2))

clear
syms u v
x(u,v) = cos(u);
y(u,v) = sin(u);
z(u,v) = v;
fsurf(x,y,z,[0 2*pi 0 5]);
axis equal; hold on;
u0 = 3.8; v0 = 4;
fplot3(x(u0,v0), y(u0,v0), z(u0,v0), '.r', 'MarkerSize', 20);