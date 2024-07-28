v = [3,4];
w = [4,-2];
quiver(v(1),v(2),0,'r');
hold on;

quiver(w(1),w(2),0,'b');

% grid on;

axis equal;

if dot(v,w) == 0
    disp("Yes the vectors are orthogonal to each other")
else
    disp("No, the vectors are not orthogonal to each other")
end