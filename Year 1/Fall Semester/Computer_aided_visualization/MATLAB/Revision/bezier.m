clear
px = [1 4 7 10];
py = [2 8 -4 9];
plot(px, py, '*--');
axis([-1 12 -1 9]);
axis equal;
n = 3;
syms t
cx(t) = 0 * t;
cy(t) = 0 * t;
for i = 0 : n
    b(t) = nchoosek(n,i)*t^i * (1-t)^(n-i);
    cx(t) = cx(t) + px(i+1) * b(t);
    cy(t) = cy(t) + py(i+1) * b(t);
end

hold on;
fplot(cx, cy, [0 1]);

%% Vector at end points of a Bezier curve%%
v0 = [n*(px(2) - px(1)), n*(py(2) - py(1))];
quiver(px(1), py(1), v0(1), v0(2), 'r');
cxd(t) = diff(cx,t);
cyd(t) = diff(cy,t);
v0e = [ cxd(0), cyd(0)];
quiver(px(1), py(1), v0e(1), v0e(2), 'b');

v1 =  [n*(px(4)-px(3)), n*(py(4)-py(3))]
quiver(px(4), py(4), v1(1), v1(2), 'r');