function approx(init_x, init_y, fin_x, h)

syms f(x,y)
f(x,y) = sym (input('y'' = ', 's'));
clf
% Eulers
disp('Calculating Eulers . . .')
x0 = [init_x];
Eulers = [init_y];
counter = 0;
while counter < (fin_x - init_x) / h
    counter =  counter + 1;
    x0(counter + 1) = x0(counter) + h;
    Eulers(counter + 1) = f(x0(counter), Eulers(counter)) * h + Eulers(counter);
end

% Improved Eulers
IEulers = [init_y];
counter = 0;
disp('Calculating Improved Eulers . . .')
while counter < (fin_x - init_x) / h;
    counter = counter + 1;
    IEulers(counter + 1) = IEulers(counter) + h / 2 * (f(x0(counter), IEulers(counter)) + f(x0(counter + 1), IEulers(counter) + h * f(x0(counter), IEulers(counter))));
end

% Taylors Series
disp('Calculating Taylor Differentials . . .')
syms f2(x,y) f3(x,y) f4(x,y)
f2(x,y) = diff(f(x,y), x) + diff(f(x,y), y) * f(x,y);
f3(x,y) = diff(f2(x,y), x) + diff(f2(x,y), y) * f2(x,y);
f4(x,y) = diff(f3(x,y), x) + diff(f3(x,y), y) * f3(x,y);

Taylor = [init_y];
counter = 0;
while counter < (fin_x - init_x) / h
    counter = counter + 1;
    Taylor(counter + 1) = Taylor(counter) + h* f(x0(counter), Taylor(counter)) + (h^2)/2 * f2(x0(counter), Taylor(counter)) + (h^3)/factorial(3 ) * f3(x0(counter), Taylor(counter)) + (h^4)/factorial(4) * f4(x0(counter), Taylor(counter));
end

disp('Calculating Runge-Kotta Approximations . . .')

k1(x,y) = h * f(x, y);
k2(x,y) = h * f(x + h / 2, y + k1 / 2);
k3(x,y) = h * f(x + h  / 2, y + k2 / 2);
k4(x,y) = h * f(x + h, y + k3);

% Calculate using h values
x0 = [init_x];
RungeKotta = [init_y];
counter = 0;
% Plot the approximations
while counter < (fin_x - init_x) / h;
    counter = counter + 1;
    x0(counter + 1) = x0(counter) + h;
    RungeKotta(counter + 1) = RungeKotta(counter) + 1/6 * (k1(x0(counter), RungeKotta(counter)) + 2*k2(x0(counter), RungeKotta(counter)) + 2*k3(x0(counter), RungeKotta(counter)) + k4(x0(counter), RungeKotta(counter)));
end

% Time to solve the function!
syms z(t)
z(t) = dsolve(diff(z) == f(t, z), z(init_x) == init_y);

hold
plot(x0, z(x0), x0, Eulers, x0, IEulers, x0, Taylor, x0, RungeKotta)
hold off;
legend('toggle')
legend('Integral Of Y', 'Eulers', 'Improved Eulers', 'Taylor Series Differentials', 'Runge-Kotta','location','bestoutside')
xlabel('X')
ylabel('Y')
title('Approximation Methods & Original Differential')
% Vector Field since Euler has the worst approx
disp('Creating Vector Field . . .')
hold ;
for x1 = [init_x:h:fin_x];
    % Use the min and max of y1 to determine best range
    for y1 = [min(Eulers):h:max(Eulers)];
        x_temp =[-.25,.25]*.25;
        y_temp = f(x1, y1) * x_temp ;
        lg = sqrt((x_temp(2)-x_temp(1)) ^ 2 + (y_temp(2) - y_temp(1)) ^ 2) * 1/(h)*2;
        plot(x1 + x_temp/ lg , y1 + y_temp / lg, 'black');
    end
end
hold off;
disp('Finished Graphing.')