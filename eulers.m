cla
% First setup the variable for automation
syms f(x,y)

% Then actually setup the equation in question
f(x,y) = x - y
init_x = 0
fin_x = 1
init_y = 1
y_max = 2
step = .125
% Vector Field
% Divide the step by 2 for a more accurate vector field
hold
for x0 = [init_x:step/2:fin_x]
    for y0 = [init_y:step/2:y_max]
        x_temp = [-step/2, step/2]*.25;
        y_temp = f(x0, y0) * x_temp;
        len = sqrt(x_temp(1)^2 + x_temp(2) ^ 2);
        plot(x_temp+x0, y_temp+y0);
    end
end
hold off
hold
x1 = [init_x]
y1 = [init_y]
counter = 0
while counter < (fin_x - init_x) / step
    counter =  counter + 1
    x1(counter + 1) = x1(counter) + step
    y1(counter + 1) = y1(counter) * step + y1(counter)
end
plot(x1, y1)
hold off