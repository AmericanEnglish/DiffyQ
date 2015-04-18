function approx(init_x, init_y, fin_x, h)

syms f(x,y)
f(x,y) = sym (input('y'' = ', 's'))
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
y2 = [init_y];
counter = 0;
disp('Calculating Improved Eulers . . .')
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

% Time to solve the function!
syms z(t)
z(t) = dsolve(diff(z) == f(t, z), z(init_x) == init_y)
base = z(x0)
y1_var = base - y1
y2_var = base - y2
y3_var = base - y3
y4_var = base - y4

plot(x0, y1_var, x0, y2_var, x0, y3_var, x0, y4_var)
legend('toggle')