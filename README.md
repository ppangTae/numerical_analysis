These are the codes that I have been working with in MATLAB to practice what I learned in my numerical analysis class.

## regression and interpolation

I set the function  $sin(x) + x + 1$ and drew 10 data points from 0 to 6. I then drew data from a normal distribution with a mean of 0 and a standard deviation of 0.5, creating noisy data. Then I ran a regression this data with a 5th order polynomial function. I also tried cubic spline.

### result

![regression_and_interpolation_figure1](https://github.com/ppangTae/numerical_analysis/assets/92343537/46df2a9e-67da-4274-ad6d-b739c54c6c9b)

## simultaneous equations

$$
u_1' = u_2 + e^tcos(t) \\ u_2' = -u_1 + 2e^{-t}sin(t) \\ u_3' = -u_2 + e^{2t}sin(t) + cos(t)
$$

I solved the above system of equations using Euler'method, Runge-Kutta 4th order, and ode45.

The first figure shows a graphical comparison of the solutions obtained by each method.
The second figure shows a comparison of the solutions obtained by Euler, RK4 and ode45 on a single plot.
The third figure shows the solution obtained by ode45 as the correct answer and the error of the RK4 and Euler methods.

### result

![simulataneous_equations_figure1](https://github.com/ppangTae/numerical_analysis/assets/92343537/e918cb87-c3c4-4d35-a7d3-996accc254bc)

![simulataneous_equations_figure2](https://github.com/ppangTae/numerical_analysis/assets/92343537/1793b6b5-2252-483c-a843-8ee7d182a5c5)

![simulataneous_equations_figure3](https://github.com/ppangTae/numerical_analysis/assets/92343537/fe941196-dcfa-497e-9c39-2c7b43625aec)

## taylor approximation

$$
f(x) = -e^{3x}sin(3x)
$$

The functions above was approximated for f(x) using first, third, and fifth order taylor series expansions.
In the first figure, I plotted each function on a single plot to compare them.
In the second figure, I calculated the error.


### result

![taylor_approximation1](https://github.com/ppangTae/numerical_analysis/assets/92343537/985e9941-6475-4be7-99c7-5571bce6da0d)

![taylor_approximation2](https://github.com/ppangTae/numerical_analysis/assets/92343537/32a2ee99-3fb0-4fc8-8010-cea3d178d99c)
