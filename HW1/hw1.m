% Exercise 1
format long
A1 = sqrt(2 + exp(log(1 + sin(pi/5))^2));

% Exercise 2
format short
A2 = [cos(0), cos(pi/4), cos(pi/2), cos(3*pi/4), cos(pi)];

% Exercise 3
z = linspace(-6, 3, 91)';
A3 = z(3:3:end);

% Exercise 4
u = linspace(3, 4, 6);
v = [0, 0.75, 1.5, 2.25, 3.0, 3.75];

% a
A4 = u.^3;

% b
A5 = sin(u) + exp(v);

% c
uT_v = u' * v;
A6 = uT_v(5, 6);
