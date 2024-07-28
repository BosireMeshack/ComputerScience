clear

px = [10 20 40 50 20];
py = [20 40 40 20 10];

plot(px, py, '*');
axis equal
hold on
n = 4;
syms t 
cx(t) = 0*t;
cy(t) = 0*t;

for i=0:n
    b(t) = nchoosek(n,i)*t^i*(1-t)^(n-i);
    cx(t) = cx(t) + px(i+1)*b(t);
    cy(t) = cy(t) + py(i+1)*b(t);
end
qx = diff(cx,t);
qy = diff(cy,t);
fplot(cx,cy, [0 1]);
P = [cx(0) cy(0) cx(1) cy(1)];
quiver(P(1), P(3), qx(0), qy(0));
quiver(P(2), P(4), qx(1), qy(1));