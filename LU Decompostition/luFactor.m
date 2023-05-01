function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix
[n, m] = size(A);
if n ~= m
    error('Input matrix must be square.');
end

L = zeros(n)
U = A
P = eye(n)

for i=1:n-1
   [piv, j] = max(abs(U(i:n,i)))
    pivot = j+i-1

        if pivot~=i
            P([i,pivot],:) = P([pivot,i],:)
            U([i,pivot],:) = U([pivot,i],:)
            L([i,pivot],:) = L([pivot,i],:)
           


        end
        for k = i+1:n
            L(k,i) = U(k,i)/U(i,i)
           U(k,i:n) = U(k,i:n)-L(k,i)*U(i,i:n)
            
        end
         
        end
end