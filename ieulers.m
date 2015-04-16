function ieulers(init_x, init_y, fin_x, step)
% Start off by setting our symbolic vars
syms f(x, y)

% Prompt for the equation
f(x, y) = sym (input('y'' = ', 's'))
cla

% Equation 4 eulers -> y1 = y0 + step/2 
x0 = [init_x]
y0 = [init_y]
counter = 0
while counter < (fin_x - init_x) / step
    counter = counter + 1
    x0(counter + 1) = x0(counter) + step
    y0(counter + 1) = y0(counter) + step / 2 * (f(x0(counter), y0(counter)) + f(x0(counter + 1), y0(counter) + step * f(x0(counter), y0(counter))))
end
hold
plot(x0, y0)
hold off

hold
for x1 = [init_x:step/2:fin_x]
    % Use the min and max of y1 to determine best range
    for y1 = [min(y0):step/2:max(y0)]
        x_temp = [-step/2, step/2]*.25;
        y_temp = f(x1, y1) * x_temp;
        lenx = sqrt(x_temp(1)^ 2 + x_temp(2) ^ 2);
        leny = sqrt(y_temp(1)^ 2 + y_temp(2) ^ 2);
        plot(x1 + x_temp, y1 + y_temp);
    end
end
hold off
disp('Finished Graphing.')
