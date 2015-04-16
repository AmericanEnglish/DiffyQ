function eulers(init_x, init_y, fin_x, step)
% First setup the variable for automation
syms f(x,y)

% Then actually setup the equation in question
f(x,y) = sym (input('y'' = ', 's'))
cla
% Graph it
hold
x1 = [init_x];
y1 = [init_y];
counter = 0;
while counter < (fin_x - init_x) / step
    counter =  counter + 1;
    x1(counter + 1) = x1(counter) + step;
    y1(counter + 1) = f(x1(counter), y1(counter)) * step + y1(counter);
end
plot(x1, y1)
hold off

% Vector Field
% Divide the step by 2 for a more accurate vector field
hold
for x0 = [init_x:step/2:fin_x]
    % Use the min and max of y1 to determine best range
    for y0 = [min(y1):step/2:max(y1)]
        x_temp = [-step/2, step/2]*.25;
        y_temp = f(x0, y0) * x_temp;
        len = sqrt(x_temp(1)^2 + x_temp(2) ^ 2);
        plot(x_temp+x0, y_temp+y0);
    end
end
hold off
disp('Finished Graphing.')