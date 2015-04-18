function approx(init_x, init_y, fin_x, h)

syms f(x,y)
f(x,y) = sym (input('y'' = ', 's'));
clf

% Calculating the values for Eulers
disp('Calculating Eulers . . .')
x0 = [init_x];
y1 = [init_y];
counter = 0;
while counter < (fin_x - init_x) / h
    counter =  counter + 1;
    x0(counter + 1) = x0(counter) + h;
    y1(counter + 1) = f(x0(counter), y1(counter)) * h + y1(counter);
end


% Improved Euelers
disp('Calculating Improved Eulers . . .')
y2 = [init_y];
counter = 0;
while counter < (fin_x - init_x) / h;
    counter = counter + 1;
    y2(counter + 1) = y2(counter) + h / 2 * (f(x0(counter), y2(counter)) + f(x0(counter + 1), y2(counter) + h * f(x0(counter), y2(counter))));
end

% Taylors Series
disp('Calculating Taylor Differentials . . .')
syms f2(x,y) f3(x,y) f4(x,y)
f2(x,y) = diff(f(x,y), x) + diff(f(x,y), y) * f(x,y);
f3(x,y) = diff(f2(x,y), x) + diff(f2(x,y), y) * f2(x,y);
f4(x,y) = diff(f3(x,y), x) + diff(f3(x,y), y) * f3(x,y);

y3 = [init_y];
counter = 0;
while counter < (fin_x - init_x) / h
    counter = counter + 1;
    x0(counter + 1) = x0(counter) + h;
    y3(counter + 1) = y3(counter) + h* f(x0(counter), y3(counter)) + (h^2)/2 * f2(x0(counter), y3(counter)) + (h^3)/factorial(3 ) * f3(x0(counter), y3(counter)) + (h^4)/factorial(4) * f4(x0(counter), y3(counter));
end

% Runge-Kotta Approximations
disp('Calculating Runge-Kotta Approximations . . .')
k1(x,y) = h * f(x, y);
k2(x,y) = h * f(x + h / 2, y + k1 / 2);
k3(x,y) = h * f(x + h  / 2, y + k2 / 2);
k4(x,y) = h * f(x + h, y + k3);

% Calculate using h values
y4 = [init_y];
counter = 0;
% Plot the approximations
while counter < (fin_x - init_x) / h;
    counter = counter + 1;
    x0(counter + 1) = x0(counter) + h;
    y4(counter + 1) = y4(counter) + 1/6 * (k1(x0(counter), y4(counter)) + 2*k2(x0(counter), y4(counter)) + 2*k3(x0(counter), y4(counter)) + k4(x0(counter), y4(counter)));
end
disp('Done Approximating!')

% Time to solve the function!
disp('Calculating Variances . . .')
syms z(t)
z(t) = dsolve(diff(z) == f(t, z), z(init_x) == init_y);
base = z(x0);
euler_variance = (base - y1);
improved_euler_variance = (base - y2);
taylor_variance = (base - y3);
Runge_Kotta_variance = (base - y4);
disp('Calculations Finished!')

% Log Plot
% plot(x0, log(abs(euler_variance)), x0, log(abs(improved_euler_variance)), x0, log(abs(taylor_variance)), x0, log(abs(Runge_Kotta_variance)))
plot(x0, euler_variance, x0, improved_euler_variance, x0, taylor_variance, x0, Runge_Kotta_variance)
legend('toggle')
legend('Eulers', 'Improved Eulers', 'Taylor Series Differentials', 'Runge-Kotta','location','bestoutside')
xlabel('X')
ylabel('Y Variance From Integral')
title('Approximation Variances')
disp('Finished Graphing.')
