function [relativeError] = RelativeErrorCal(A, B , na, nb)
%
    A_col_norm = norm(A(:, na));
    B_col_norm = norm(B(:, nb));
    
    relativeError = A_col_norm / B_col_norm;
    
end