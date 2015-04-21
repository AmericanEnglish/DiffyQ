function taylor_diff(init_x, init_y, fin_x, h)

% Create symbolic f(x,y)
syms f(x,y)

% Prompt for function
f(x,y) = sym (input('y'' = ', 's'))

% Setup the 4th order taylor
syms f2(x,y) f3(x,y) f4(x,y)
f2(x,y) = diff(f(x,y), x) + diff(f(x,y), y) * f(x,y);
f3(x,y) = diff(f2(x,y), x) + diff(f2(x,y), y) * f2(x,y);
f4(x,y) = diff(f3(x,y), x) + diff(f3(x,y), y) * f3(x,y);

x0 = [init_x];
y0 = [init_y];
counter = 0;
while counter < (fin_x - init_x) / h
    counter = counter + 1;
    x0(counter + 1) = x0(counter) + h;
    y0(counter + 1) = y0(counter) + h* f(x0(counter), y0(counter)) + (h^2)/2 * f2(x0(counter), y0(counter)) + (h^3)/factorial(3 ) * f3(x0(counter), y0(counter)) + (h^4)/factorial(4) * f4(x0(counter), y0(counter));
end
plot(x0, y0);

disp('Creating Vector Field . . .')
hold ;
for x1 = [init_x:h:fin_x];
    % Use the min and max of y1 to determine best range
    for y1 = [min(y0):h:max(y0)];
        x_temp =[-.25,.25]*.25;
        y_temp = f(x1, y1) * x_temp ;
        lg = sqrt((x_temp(2)-x_temp(1)) ^ 2 + (y_temp(2) - y_temp(1)) ^ 2) * 20;
        plot(x1 + x_temp/ lg , y1 + y_temp / lg, 'black');
    end
end
hold off;
disp('Finished Graphing.')

