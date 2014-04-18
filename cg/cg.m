function [x,hist_residual] = cg_code( A, rhs, maxIter, tol )
%CG Summary of this function goes here
%   Detailed explanation goes here
% A is sparse matrix
% X, B are dense matrix

x = ones (size(rhs));
r = rhs - A * rhs;
r_norm = norm (r);
hist_residual(1)=r_norm;
fprintf ('fist residual norm = %20.16f\n', r_norm);
p=r;
for i = 1:maxIter
    Ap = A * p;
    alpha = r_norm / dot(Ap, p);
    x = x + alpha * p
    r = r - alpha * Ap;
    
    r_norm_next = dot(r,r);
    if r_norm_next < tol
        fprint ('final norm is %dth = %20.16f\n',i,r_norm_next);
        break;
    end
    
    hist_residual(i+1) = r_norm_next;
    beta = r_norm_next / r_norm;
    p = r + beta * p;
    
    r_norm = r_norm_next;
    fprintf ('%dth = %20.16f\n', i,r_norm);
end


end

