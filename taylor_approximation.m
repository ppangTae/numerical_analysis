clc; clear;

syms x
f = -exp(3*x)*sin(3*x);

% When performing a Taylor approximation, the approximation is centered around x0,
% which is a given value.
x0 = 1;

% Calculate the derivatives of f using the diff function in syms.
dfdx1 = diff(f, 1, 'x');
dfdx2 = diff(f, 2, 'x');
dfdx3 = diff(f, 3, 'x');
dfdx4 = diff(f, 4, 'x');
dfdx5 = diff(f, 5, 'x');

% Calculate the Taylor approximations of orders 1 to 5.
f_taylor1 = subs(f, x0) + (x - x0) * subs(dfdx1, x0);
f_taylor2 = f_taylor1 + (x - x0)^2 * subs(dfdx2, x0) / factorial(2);
f_taylor3 = f_taylor2 + (x - x0)^3 * subs(dfdx3, x0) / factorial(3);
f_taylor4 = f_taylor3 + (x - x0)^4 * subs(dfdx4, x0) / factorial(4);
f_taylor5 = f_taylor4 + (x - x0)^5 * subs(dfdx5, x0) / factorial(5);

figure;
fplot(f, [0.5, 1.5], 'k--', 'LineWidth', 2); % Original function
hold on;
fplot(f_taylor1, [0.5, 1.5], 'r', 'LineWidth', 1.5); % 1st order Taylor
fplot(f_taylor3, [0.5, 1.5], 'b-.', 'LineWidth', 1.5); % 3rd order Taylor
fplot(f_taylor5, [0.5, 1.5], 'g:', 'LineWidth', 1.5); % 5th order Taylor
legend('Original function', '1st order Taylor approximation', '3rd order Taylor approximation', '5th order Taylor approximation');
title('Original Function and Taylor Approximations');
xlabel('x');
ylabel('f(x)');
grid on;
hold off;

% Calculate the error
figure;
fplot(f - f_taylor1, [0.5, 1.5], 'r', 'LineWidth', 1.5);
hold on;
fplot(f - f_taylor3, [0.5, 1.5], 'b', 'LineWidth', 1.5);
fplot(f - f_taylor5, [0.5, 1.5], 'g', 'LineWidth', 1.5);
legend('1st order approximation error', '3rd order approximation error', '5th order approximation error');
title('Taylor Approximation Errors');
xlabel('x');
ylabel('Error');
grid on;
hold off;
