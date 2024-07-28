clear
px = [1 4 6];
py = [2 8 -4];
plot(px, py,'.r--' ,"MarkerSize", 20);
axis([0 5 -5 10]);
ax  = gca;
ax.XAxisLocation = ("origin");
ax.YAxisLocation = ("origin");
box off;
grid on;