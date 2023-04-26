A = [1 1 1; 4 3 -1; 3 5 3];
[L, U] = LU(A);

A1 = L;
A2 = U;

disp('L:');
disp(A1);
disp('U:');
disp(A2);

function [L, U] = LU(A)
    % Check if the matrix is square
    [rows, cols] = size(A);
    if rows ~= cols
        error('The input matrix must be square.');
    end
    
    n = rows;
    
    % Initialize L and U matrices
    L = eye(n);
    U = A;
    
    % Perform LU decomposition using Gaussian elimination
    for k = 1:n-1
        for i = k+1:n
            if U(k,k) == 0
                error('The matrix A is not regular.');
            end
            L(i,k) = U(i,k) / U(k,k);
            U(i,k:n) = U(i,k:n) - L(i,k) * U(k,k:n);
        end
    end
end


