clear
% implicit on a plane
syms x y z
% Plots 3D Equation/Function
F(x,y,z) = x^2 + y^2 + z^2 - 1; 
fimplicit3(F,[-1 0 -1 1 -1 1] );
axis equal
F(1,0,0);
F(1,0,1);

% Free form curves
% Hermite curve 4 points interpolated
% More points - parametric curve
% solving system of equations
% t in [0,1]
% c(t) cx(t), cy(t)


px = [-1 2 5 8];
py = [1 4 5 3.5];

plot(px,py,'*');

axis equal; hold on; 

t1 = 1; t2 = 3; t3 = 4; t4 = 5;
% syms t a3 a2 a1 a0 b3 b2 b1 b0
% system of equations
% e = [ a3*t1^3  + a2*t1^2 + a1*t1 + a0 == px(1),... 
%       a3*t2^3  + a2*t2^2 + a1*t2 + a0 == px(2), ...
%       a3*t3^3  + a2*t3^2 + a1*t3 + a0 == px(3),...
%       a3*t4^3  + a2*t4^2 + a1*t4 + a0 == px(4)
%      ];
% s = solve(e, [a3 a2 a1 a0]);
% cx(t) = s.a3 * t^3 + s.a2*t^2 +s.a1*t^1 +s.a0

% syms t a3 a2 a1 a0 b3 b2 b1 b0
% % for x
% 
% x(t) = a3*t^3 + a2*t^2 + a1*t + a0;
% e = [ x(t1) == px(1), x(t2) == px(2), x(t3) == px(3) x(t4) == px(4)];
% s = solve(e, [a3 a2 a1 a0]);
% cx(t) = subs(x, [a3 a2 a1 a0], [s.a3 s.a2 s.a1 s.a0]);
% 
% % for y
% y(t) = b3*t^3 + b2*t^2 + b1*t + b0;
% e = [ y(t1) == py(1), y(t2) == py(2), y(t3) == py(3) y(t4) == py(4)];
% s = solve(e, [b3 b2 b1 b0]);
% cy(t) = subs(y,[b3 b2 b1 b0], [s.b3 s.b2 s.b1 s.b0]);
% fplot(cx, cy, [t1 t4]);


% Tangent vectors Hermite arc
% Two point two vector hermite arc


px = [2 8]; py = [4 5];
plot(px, py, '*'); axis equal; hold on;
vx = [2 0]; vy = [-10 12];
quiver(px(1), py(1), vx(1), vy(1))
quiver(px(2), py(2), vx(2), vy(2))
syms t a3 a2 a1 a0 b3 b2 b1 b0

% for x

x(t) = a3*t^3 + a2*t^2 + a1*t + a0;
xd(t) = diff(x,t);
t1 = -1; t2 =1;
e = [x(t1)==px(1), x(t2)==px(2), xd(t1)==vx(1), xd(t2)==vx(t2)]
s = solve(e, [a3 a2 a1 a0]);
cx(t) = subs(x, [a3 a2 a1 a0], [s.a3 s.a2 s.a1 s.a0]);

% for y
y(t) = b3*t^3 + b2*t^2 + b1*t + b0;
yd(t) = diff(y,t);
e = [ y(t1) == py(1), y(t2) == py(2), yd(t1) == vy(1) yd(t1) == vy(t2)];
s = solve(e, [b3 b2 b1 b0]);
cy(t) = subs(y,[b3 b2 b1 b0], [s.b3 s.b2 s.b1 s.b0]);
fplot(cx, cy, [t1 t2]);

