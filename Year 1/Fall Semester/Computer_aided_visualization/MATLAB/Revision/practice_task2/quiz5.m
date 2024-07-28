clear

syms u  v

% px = [0 0];
% py = [0 1];
% pz = [0 1];
% rx = [1 1];
% ry = [0 1];
% rz = [1 0];
% hold on
% fplot3(px, py, pz, [0 1], '*--', 'color', 'b');
% plot3(rx, ry, rz, '+--', 'color','r')
% axis([-1 12 -1 9]);
% axis equal
% 
% n = 1;
% 
% cx(u) = 0*u;
% cy(u) = 0*u;
% cz(u) = 0*u;
% dx(u) = 0*u;
% dy(u) = 0*u;
% dz(u) = 0*u;
% for i = 0: n
%     b(u) = nchoosek(n,i)*u^i*(1-u)^(n-i);
%     cx(u) = cx(u)+px(1+i)*b(u)
%     cy(u) = cy(u)+py(i+1)*b(u)
%     cz(u) = cz(u)+pz(i+1)*b(u)
% end
% hold on
% fplot3(cx,cy,cz, [0 1]);



% syms u v 
 px = [0 0];
 py = [0 1];
 pz = [0 1];

 ppx(u) = (1-u)*px(1) + u*px(2);
 ppy(u) = (1-u)*py(1) + u*py(2);
ppz(u) = (1-u)*pz(1) + u*pz(2);

fplot3(ppx,ppy,ppz,[0 1],'.r','MarkerSize',20);
 hold on;

rx = [1 1];
ry = [0 1];
rz = [1 0];

rrx(u) = (1-u)*rx(1) + u*rx(2);
rry(u) = (1-u)*ry(1) + u*ry(2);
rrz(u) = (1-u)*rx(1) + u*rz(2);

fplot3(rrx,rry,rrz,[0 1],'.b','MarkerSize',20);
hold on;

sx(u,v) = (1- v)* ppx(u) + v*rrx(u);
sy(u,v) = (1- v)* ppy(u) + v*rry(u);
sz(u,v) = (1- v)* ppz(u) + v*rrz(u);

fsurf(sx,sy,sz,[0 1 0 1]);