function [x,hist_residual] = cg_code( A, rhs, maxIter, tol )
%CG Summary of this function goes here
%   Detailed explanation goes here
% A is sparse matrix
% X, B are dense matrix
b_norm = norm(rhs);
x = ones (size(rhs));
%norm(x)
r = rhs - A * x;
r_norm = norm (r);
hist_residual(1)=r_norm/b_norm;
fprintf ('first residual norm = %20.16f\n', hist_residual(1));
rTr=r' * r;
p=r;
for i = 1:maxIter
    Ap = A * p;
    alpha = rTr/ dot(Ap, p);
    x = x + alpha * p;
    r = r - alpha * Ap;
    
    rTr_next = dot(r,r);
    r_norm = sqrt (rTr_next);
    
    
    hist_residual(i+1) = r_norm/b_norm;
    if hist_residual(i+1) < tol
        fprint ('final norm is %dth = %20.16f\n',i,hist_residual(i+1));
        break;
    end
    
    beta = rTr_next / rTr;
    p = r + beta * p;
    
    rTr = rTr_next;
    fprintf ('%dth = %20.16f\n', i,hist_residual(i+1));
end


end

