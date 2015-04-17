function runge_kotta(init_x, init_y, fin_x, h)
% Symolic Equation
syms f(x,y)

% Acquire the differential equation
f(x, y) = sym (input('y'' = ', 's'))
syms k1(x,y) k2(x,y) k3(x,y) k4(x,y)
% Set up k1 -> k4
k1(x,y) = h * f(x, y);
k2(x,y) = h * f(x + h / 2, y + k1 / 2);
k3(x,y) = h * f(x + h  / 2, y + k2 / 2);
k4(x,y) = h * f(x + h, y + k3);

% Calculate using h values
x0 = [init_x];
y0 = [init_y];
counter = 0;
% Plot the approximations
disp('Calculating Data Points . . .')
while counter < (fin_x - init_x) / h;
    counter = counter + 1;
    x0(counter + 1) = x0(counter) + h;
    y0(counter + 1) = y0(counter) + 1/6 * (k1(x0(counter), y0(counter)) + 2*k2(x0(counter), y0(counter)) + 2*k3(x0(counter), y0(counter)) + k4(x0(counter), y0(counter)));
end
plot(x0, y0)
% Plot the vector field
disp('Creating Vector Field . . .')
hold ;
for x1 = [init_x:h/2:fin_x];
    % Use the min and max of y1 to determine best range
    for y1 = [min(y0):h/2:max(y0)];
        x_temp =[-.25,.25]*.25;
        y_temp = f(x1, y1) * x_temp ;
        lg = sqrt((x_temp(2)-x_temp(1)) ^ 2 + (y_temp(2) - y_temp(1)) ^ 2) * 1/h;
        plot(x1 + x_temp/ lg , y1 + y_temp / lg, 'black');
    end
end
hold off;
disp('Finished Graphing.')