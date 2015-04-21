function runge_kotta(init_x, fin_x, h)
% Symolic Equation
syms f(x,y)

% Acquire the differential equation
f(x, y) = sym (input('y'' = ', 's'))
clf

% Plot the vector field
disp('Creating Vector Field . . .')
hold ;
for x1 = [init_x:h:fin_x];
    % Use the min and max of y1 to determine best range
    for y1 = [-.5:h/2:4];
        x_temp =[-h,h]*.25;
        y_temp = f(x1, y1) * x_temp ;
        lg = sqrt((x_temp(2)-x_temp(1)) ^ 2 + (y_temp(2) - y_temp(1)) ^ 2) *20;
        plot(x1 + x_temp/ lg , y1 + y_temp / lg, 'black');
    end
end
hold off;
title('Vector Field of y'' = cos(x) - sin(x)- y')
xlabel('X')
ylabel('Y')
disp('Finished Graphing.')