clear
%Drawing a line between two points
px = [-2 3 5 8];
py = [-1 7 0 -2];
plot(px, py, 'r.--', 'MarkerSize',13);
axis([-4 14 -6 10]);
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
box off
grid on