clc; clear;

%% Euler Method
[t, y] = eulode(@funcset1, [0 2], [0 0 1], 0.1);

%% RK4 Method
[t1, y1] = RK_4sys(@funcset2, [0 2], [0 0 1], 0.1);

%% Built-in ode45
[t2, y2] = ode45(@funcset2, 0:0.1:2, [0 0 1]);

%% Plotting
figure;

subplot(3,3,1)
plot(t, y(:,1))
xlabel('t')
ylabel('u1(t)')
title('Euler Method')

subplot(3,3,4)
plot(t, y(:,2))
xlabel('t')
ylabel('u2(t)')

subplot(3,3,7)
plot(t, y(:,3))
xlabel('t')
ylabel('u3(t)')

subplot(3,3,2)
plot(t1, y1(:,1))
xlabel('t')
ylabel('u1(t)')
title('RK4 Method')

subplot(3,3,5)
plot(t1, y1(:,2))
xlabel('t')
ylabel('u2(t)')

subplot(3,3,8)
plot(t1, y1(:,3))
xlabel('t')
ylabel('u3(t)')

subplot(3,3,3)
plot(t2, y2(:,1))
xlabel('t')
ylabel('u1(t)')
title('ode45 Method')

subplot(3,3,6)
plot(t2, y2(:,2))
xlabel('t')
ylabel('u2(t)')

subplot(3,3,9)
plot(t2, y2(:,3))
xlabel('t')
ylabel('u3(t)')

%% Combined Plot for Comparison
figure;

subplot(3,1,1)
hold on
plot(t, y(:,1), 'LineWidth', 1)
plot(t1, y1(:,1), 'LineWidth', 1)
plot(t2, y2(:,1), 'LineWidth', 1)
xlabel('t')
ylabel('u1(t)')
legend('Euler', 'RK4', 'ode45')
title('Comparison of u1(t)')
hold off

subplot(3,1,2)
hold on
plot(t, y(:,2), 'LineWidth', 1)
plot(t1, y1(:,2), 'LineWidth', 1)
plot(t2, y2(:,2), 'LineWidth', 1)
xlabel('t')
ylabel('u2(t)')
legend('Euler', 'RK4', 'ode45')
title('Comparison of u2(t)')
hold off

subplot(3,1,3)
hold on
plot(t, y(:,3), 'LineWidth', 1)
plot(t1, y1(:,3), 'LineWidth', 1)
plot(t2, y2(:,3), 'LineWidth', 1)
xlabel('t')
ylabel('u3(t)')
legend('Euler', 'RK4', 'ode45')
title('Comparison of u3(t)')
hold off

%% Error Plot
figure;

subplot(3,1,1)
hold on
plot(t, y2(:,1) - y(:,1), 'LineWidth', 1)
plot(t, y2(:,1) - y1(:,1), 'LineWidth', 1)
xlabel('t')
ylabel('u1(t)')
legend('Error: Euler', 'Error: RK4')
title('Error Comparison of u1(t)')
hold off

subplot(3,1,2)
hold on
plot(t, y2(:,2) - y(:,2), 'LineWidth', 1)
plot(t, y2(:,2) - y1(:,2), 'LineWidth', 1)
xlabel('t')
ylabel('u2(t)')
legend('Error: Euler', 'Error: RK4')
title('Error Comparison of u2(t)')
hold off

subplot(3,1,3)
hold on
plot(t, y2(:,3) - y(:,3), 'LineWidth', 1)
plot(t, y2(:,3) - y1(:,3), 'LineWidth', 1)
xlabel('t')
ylabel('u3(t)')
legend('Error: Euler', 'Error: RK4')
title('Error Comparison of u3(t)')
hold off

%% Function Definitions
function dydt = funcset1(t, y)
    % must pass dydt to rows
    dydt = [y(2) + exp(t) * cos(t), -y(1) + 2 * exp(-t) * sin(t), -y(2) + exp(2 * t) * sin(t) + cos(t)];
end

function dydt = funcset2(t, y)
    dydt = zeros(3, 1); % preallocate
    dydt(1) = y(2) + exp(t) * cos(t);
    dydt(2) = -y(1) + 2 * exp(-t) * sin(t);
    dydt(3) = -y(2) + exp(2 * t) * sin(t) + cos(t);
end
