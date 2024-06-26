clc; clear;

original_func = @(x) sin(x) + x + 1;

xdata = linspace(0,6,10);
ydata = original_func(xdata);

% Set noise
noise = normrnd(0, 0.5, [1,10]);

% Add noise to the function
y_noisy = ydata + noise;

% Create figure and set up subplots
figure;
% Original function and noisy data points
subplot(2,2,1);
fplot(original_func, [0 6], 'b', 'LineWidth', 2); % original function
hold on;
plot(xdata, y_noisy, 'ro'); % noisy data
legend('original function', 'noisy data');
title('Original Function and Noisy Data');
grid on
hold off;

% 5th order polynomial regression
fifth_order_obj_func = @(p) sum((y_noisy - (p(1)*xdata.^5 + p(2)*xdata.^4 + p(3)*xdata.^3 + p(4)*xdata.^2 + p(5)*xdata + p(6))).^2);
initial_value1 = zeros(1, 6);
[op, fval1] = fminsearch(fifth_order_obj_func, initial_value1);

fifth_order_reg_func = @(k) op(1)*k.^5 + op(2)*k.^4 + op(3)*k.^3 + op(4)*k.^2 + op(5)*k + op(6);

x = linspace(0,6,100);
y_fifth_order_reg = fifth_order_reg_func(x);

subplot(2,2,2);
fplot(original_func, [0 6], 'b', 'LineWidth', 2); % original function
hold on;
plot(xdata, y_noisy, 'ro');
plot(x, y_fifth_order_reg, 'g');
legend('original function', 'noisy data', '5th order polynomial regression');
title('Original Function and 5th Order Polynomial Regression');
hold off;

% Spline interpolation
yy_cubic = spline(xdata, y_noisy, x); % cubic
yy_natural = spline(xdata, [0 y_noisy 0], x);

subplot(2,2,3);
plot(xdata, y_noisy, 'ro');
hold on;
plot(x, yy_cubic, 'b');
plot(x, yy_natural, 'g');
legend('noisy data', 'spline cubic', 'spline natural');
title('Spline Interpolation');
hold off;

% Compare all results
y_original = original_func(x);

subplot(2,2,4);
plot(xdata, y_noisy, 'ro');
hold on;
plot(x, yy_cubic, 'b', 'LineWidth', 2); % cubic spline
plot(x, yy_natural, 'g', 'LineWidth', 2); % natural spline
fplot(original_func, [0 6], 'r', 'LineWidth', 2); % original function
plot(x, y_fifth_order_reg, 'm', 'LineWidth', 1.5); % 5th order regression
legend('noisy data', 'spline cubic', 'spline natural', 'original function', '5th order regression');
title('Comparison of All Results');
hold off;
