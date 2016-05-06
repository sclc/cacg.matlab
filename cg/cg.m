function [x,hist_residual] = cg( A, x, rhs, maxIter, tol )
%CG Summary of this function goes here
%   Detailed explanation goes here
% A is sparse matrix
% X, B are dense matrix

r = rhs - A * x;
rTr = dot(r,r);
r_norm = sqrt (rTr);
hist_residual(1)=r_norm;
fprintf ('fist residual norm = %20.16f\n', r_norm);
p=r;
for i = 1:maxIter
    Ap = A * p;
    alpha = rTr / dot(Ap, p);
    %ptAp_db = dot(Ap, p);
    %ptp_old_db = dot(p,p);
    %sprintf('rTr:%f,ptAp:%f', rTr, dot(Ap,p))
    x = x + alpha * p;
    %disp(dot(x,x))
    r = r - alpha * Ap;
    
    rTr_next = dot(r,r);
    if sqrt(rTr_next) < tol
        break;
    end
    
    hist_residual(i+1) = sqrt(rTr_next);
    beta = rTr_next / rTr;
    %disp(beta)
    p = r + beta * p;
    %disp(dot(p,p))
    
    rTr = rTr_next;
    fprintf ('%dth = %20.16f\n', i,sqrt(rTr) );
    %fprintf('ptAp:%f, alpha:%f, beta:%f, old_p_innerProduct:%f, new_p_innerProduct:%f, new_r_innerProduct:%f\n', ptAp_db, alpha, beta, ptp_old_db, dot(p,p), rTr)
end


end

