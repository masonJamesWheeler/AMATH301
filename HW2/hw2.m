% Exercise 1. (Component Skill 2.1)
% Part a
n = 50;
A1 = NaN(n,n); % Create a matrix of NaNs
for i = 1:n
    for j = 1:n
        A1(i,j) = 1/(i+j-1); % Fill in values for Hilbert matrix
    end
end

% Part b
A2 = A1(:,1:2:end); % Extract odd columns using colon operator

% Exercise 2. (Component Skill 2.2)

A3 = myfun_hw2(-1);
A4 = myfun_hw2(1/2);
A5 = myfun_hw2(1);

% Initialize the range for the x-axis
x = linspace(-2*pi, 2*pi, 1000);

% Define the functions
f = sin(x);
T1 = x;
T2 = x - (1/6) * x.^3;
T3 = x - (1/6) * x.^3 + (1/120) * x.^5;

% Create the plot
figure
hold on
plot(x, f, 'k', 'LineWidth', 3.5)
plot(x, T1, 'r', 'LineWidth', 2)
plot(x, T2, 'g--', 'LineWidth', 2)
plot(x, T3, 'b:', 'LineWidth', 2)
xlim([-2*pi, 2*pi])
ylim([-2, 2])
xlabel('x', 'FontSize', 25)
ylabel('y', 'FontSize', 25)
title('Graph of sin(x) and its Taylor Polynomials', 'FontSize', 35)
legend({'sin(x)', 'T1(x)', 'T2(x)', 'T3(x)'}, 'FontSize', 20, 'Location', 'southwest')
set(gca, 'FontSize', 20)
grid on
box on
hold off

function f = myfun_hw2(x)
    if x < -1
        f = x + 1;
    elseif x < 0
        f = x^2;
    elseif x < 1
        f = x - 2;
    else
        f = x^2 + 1;
    end
end

