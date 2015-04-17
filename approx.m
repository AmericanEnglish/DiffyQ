function approx(init_x, init_y, fin_x, h)

syms f(x,y)
f(x,y) = sym (input('y'' = ', 's'))
clf
disp('Calculating Eulers . . .')
hold ;
x1 = [init_x];
y1 = [init_y];
counter = 0;
while counter < (fin_x - init_x) / h
    counter =  counter + 1;
    x1(counter + 1) = x1(counter) + h;
    y1(counter + 1) = f(x1(counter), y1(counter)) * h + y1(counter);
end
plot(x1, y1)
hold off ;

% Vector Field since Euler has the worst approx
disp('Creating Vector Field . . .')
hold ;
for x1 = [init_x:h/2:fin_x];
    % Use the min and max of y1 to determine best range
    for y1 = [min(y0):h/2:max(y0)];
        x_temp =[-.25,.25]*.25;
        y_temp = f(x1, y1) * x_temp ;
        lg = sqrt((x_temp(2)-x_temp(1)) ^ 2 + (y_temp(2) - y_temp(1)) ^ 2) * 1/(h)*5;
        plot(x1 + x_temp/ lg , y1 + y_temp / lg, 'black');
    end
end
hold off;


% Improved Euelers
x0 = [init_x];
y0 = [init_y];
counter = 0;
disp('Calculating Improved Eulers . . .')
while counter < (fin_x - init_x) / h;
    counter = counter + 1;
    x0(counter + 1) = x0(counter) + h;
    y0(counter + 1) = y0(counter) + h / 2 * (f(x0(counter), y0(counter)) + f(x0(counter + 1), y0(counter) + h * f(x0(counter), y0(counter))));
end
hold;
plot(x0, y0, 'cyan')
hold off;

% Taylors Series
disp('Calculating Taylor Differentials . . .')
hold;
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
plot(x0, y0, 'red');
hold off;

hold;
disp('Calculating Runge-Kotta Approximations . . .')

k1(x,y) = h * f(x, y);
k2(x,y) = h * f(x + h / 2, y + k1 / 2);
k3(x,y) = h * f(x + h  / 2, y + k2 / 2);
k4(x,y) = h * f(x + h, y + k3);

% Calculate using h values
x0 = [init_x];
y0 = [init_y];
counter = 0;
% Plot the approximations
while counter < (fin_x - init_x) / h;
    counter = counter + 1;
    x0(counter + 1) = x0(counter) + h;
    y0(counter + 1) = y0(counter) + 1/6 * (k1(x0(counter), y0(counter)) + 2*k2(x0(counter), y0(counter)) + 2*k3(x0(counter), y0(counter)) + k4(x0(counter), y0(counter)));
end
plot(x0, y0, 'green')
hold off;

disp('Finished Graphing.')