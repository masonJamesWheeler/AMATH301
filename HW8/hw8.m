% Constants
mu = 3.5;
sigma = 0.7;
a = 4.5;
b = 6;

% Exact value of P
P_exact = integral(@(x) exp(-(x-mu).^2/(2*sigma^2))/(sigma*sqrt(2*pi)), a, b);

% Midpoint rule
N = [2, 4, 8, 16, 32];
A2 = zeros(5, 1);
for i = 1:5
    h = (b-a)/N(i);
    x = a + h/2 : h : b - h/2;
    A2(i) = h * sum(exp(-(x-mu).^2/(2*sigma^2))/(sigma*sqrt(2*pi)));
end
A3 = abs(A2 - P_exact);

% Trapezoidal rule
A4 = zeros(5, 1);
for i = 1:5
    h = (b-a)/N(i);
    x = a : h : b;
    A4(i) = h/2 * (exp(-(a-mu).^2/(2*sigma^2))/(sigma*sqrt(2*pi)) + ...
        2*sum(exp(-(x(2:end-1)-mu).^2/(2*sigma^2))/(sigma*sqrt(2*pi))) + ...
        exp(-(b-mu).^2/(2*sigma^2))/(sigma*sqrt(2*pi)));
end
A5 = abs(A4 - P_exact);

% Simpson's 1/3 rule
A6 = zeros(5, 1);
for i = 1:5
    h = (b-a)/N(i);
    x = a : h : b;
    A6(i) = h/3 * (exp(-(a-mu).^2/(2*sigma^2))/(sigma*sqrt(2*pi)) + ...
        4*sum(exp(-(x(2:2:end-1)-mu).^2/(2*sigma^2))/(sigma*sqrt(2*pi))) + ...
        2*sum(exp(-(x(3:2:end-2)-mu).^2/(2*sigma^2))/(sigma*sqrt(2*pi))) + ...
        exp(-(b-mu).^2/(2*sigma^2))/(sigma*sqrt(2*pi)));
end
A7 = abs(A6 - P_exact);

% Plot
N = [2, 4, 8, 16, 32];
semilogy(N, A3, 'b-', 'LineWidth', 2);
hold on;
semilogy(N, A5, 'r-', 'LineWidth', 2);
semilogy(N, A7, 'k-', 'LineWidth', 2);
legend('Midpoint', 'Trapezoid', 'Simpson', 'Location', 'northeast');
xlim([0, 33]);
ylim([1e-8, 1e-1]);
xlabel('N', 'FontSize', 20);
ylabel('log10(error)', 'FontSize', 20);
title('Error of Numerical Integration Methods', 'FontSize', 20);
set(gca, 'FontSize', 10);
grid on;
box on;