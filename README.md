These are the codes that I have been working with in MATLAB to practice what I learned in my numerical analysis class.

## regression and interpolation

I set the function  $sin(x) + x + 1$ and drew 10 data points from 0 to 6. I then drew data from a normal distribution with a mean of 0 and a standard deviation of 0.5, creating noisy data. Then I ran a regression this data with a 5th order polynomial function. I also tried cubic spline.

### result

![regression_and_interpolation_figure1](https://github.com/ppangTae/numerical_analysis/assets/92343537/03cd7e62-7f6d-4708-98d3-09fc3bc0f6e4)

## simultaneous equations

$$
\begin{aligned}
u_1' &= u_2 + e^tcos(t) \\
u_2' &= -u_1 + 2e^{-t}sin(t) \\
u_3' &= -u_2 + e^{2t}sin(t) + \cos(t)
\end{aligned}
$$

I solved the above system of equations using Euler'method, Runge-Kutta 4th order, and ode45.

The first figure shows a graphical comparison of the solutions obtained by each method.
The second figure shows a comparison of the solutions obtained by Euler, RK4 and ode45 on a single plot.
The third figure shows the solution obtained by ode45 as the correct answer and the error of the RK4 and Euler methods.

### result

![simulataneous_equations_figure1](https://github.com/ppangTae/numerical_analysis/assets/92343537/fdf80754-44b0-4fea-9e1f-d9d48c36d3ce)

![simulataneous_equations_figure2](https://github.com/ppangTae/numerical_analysis/assets/92343537/d93e3b80-999d-4f0c-a56e-ad6ac999b540)

![simulataneous_equations_figure3](https://github.com/ppangTae/numerical_analysis/assets/92343537/bbfcf920-7eaf-4dad-b7aa-1036be547f9b)

## taylor approximation

$$
f(x) = -e^{3x}sin(3x)
$$

The functions above was approximated for f(x) using first, third, and fifth order taylor series expansions.
In the first figure, I plotted each function on a single plot to compare them.
In the second figure, I calculated the error.


### result

![taylor_approximation1](https://github.com/ppangTae/numerical_analysis/assets/92343537/6709b130-ebaf-48b6-bf97-8ec02bf5bfc7)

![taylor_approximation2](https://github.com/ppangTae/numerical_analysis/assets/92343537/55ea02ad-f23a-46dd-92d5-f0416ea48507)
