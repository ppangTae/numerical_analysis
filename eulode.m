function [t, y] = eulode(dydt, tspan, y0, h, varargin)
%EULODE: Euler ODE solver
%   [t, y] = eulode(dydt, tspan, y0, h, p1, p2, …)
%   uses Euler's method to integrate an ODE
%   input:
%       dydt  - function handle that evaluates the ODE
%       tspan - [ti, tf] where ti and tf are the initial and final
%               values of the independent variable
%       y0    - initial value of the dependent variable
%       h     - step size
%       p1, p2, … - additional parameters used by dydt
%   output:
%       t - vector of independent variable
%       y - vector of solution for dependent variable

    if nargin < 4
        error('At least 4 input arguments are required')
    end

    ti = tspan(1); 
    tf = tspan(2);

    if ~(tf > ti)
        error('Upper limit must be greater than lower limit')
    end

    t = (ti:h:tf)';
    n = length(t);

    % If necessary, add an additional value of t so that range goes from t = ti to tf
    % t vector를 생성하는 과정에서 일정 간격으로 생성하다보면 마지막 값이 tf가 아닐 수 있어서 이런 처리를 함.
    if t(n) < tf
        t(n+1) = tf;
        n = n+1;
    end
    
    y = ones(n, length(y0)); % Preallocate y to improve efficiency (세로로 쫙 배열)
    y(1,:) = y0; % Ensure y0 is a row vector

    for i = 1:n-1 % Implement Euler's method
        y(i+1,:) = y(i,:) + dydt(t(i), y(i,:), varargin{:}) * h;
    end
end
