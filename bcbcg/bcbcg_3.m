function [X,hist_residual] = bcbcg_3(A, RHS, s_k, blocksize, X, eigenValue_max, eigenValue_min,maxIters, tol)
%% block chebyshev basis conjugat gradient
%   inherited from bchcg_1, however, now we get eigenValue_max and
%   eigenValue_min from arguments rahter than call gerschgorin_1(A)
%   hist_residual contans : norm ( X'AX - X'RHS)

s_alpha = 2.0 / (eigenValue_max - eigenValue_min);
s_beta  = - (eigenValue_max + eigenValue_min) / (eigenValue_max - eigenValue_min);
R = RHS - A*X;
PHI = X'* (A*X - RHS);
InterestedColIdx=1;
% hist_residual(1,:) = [1 norm(PHI(:,InterestedColIdx)) norm(X(:,InterestedColIdx)) ...
%     dot( X(:,InterestedColIdx), RHS(:,InterestedColIdx)) ...
%     dot( X(:,InterestedColIdx), R(:,InterestedColIdx))];
hist_residual(1,:) = [1 sum(abs(diag(PHI))) norm(X(:,InterestedColIdx)) ...
    dot( X(:,InterestedColIdx), RHS(:,InterestedColIdx)) ...
    abs(dot( X(:,InterestedColIdx), R(:,InterestedColIdx)))];
for ind = 1:maxIters
    % generate s_k dim subspace
    s_k = uint32(s_k);
    for dimInd = 1:s_k
        if dimInd == 1
            SS(:, 1:blocksize) = R;
        elseif dimInd == 2
            SS (:, blocksize+1:blocksize*2) = s_alpha * A * R + s_beta * R;
        else
            SS(:, blocksize*(dimInd-1)+1:blocksize*dimInd) = 2 * s_alpha * A * SS(:, blocksize*(dimInd -2)+1:blocksize*(dimInd -1)) ...
                + 2 * s_beta * SS(:, blocksize*(dimInd -2)+1:blocksize*(dimInd -1))...
                - SS(:, blocksize*(dimInd -3)+1:blocksize*(dimInd -2));
        end
    end
    % A-orthogonalization
    if ind == 1
        Q = SS;
    else
        Qtran_A_SS = A_Q' * SS;
        B = Qtran_A_Q_inv * Qtran_A_SS;
        Q = SS - Q * B;
    end
    
    % get parameter to update x
    A_Q = A * Q;
    Qtran_A_Q = Q' * A_Q;
    Qtran_A_Q_inv = inv(Qtran_A_Q);
    para_alpha = Qtran_A_Q_inv * Q'* R;
    
    % update x
    X = X + Q * para_alpha;
    R = R - A_Q * para_alpha;
    PHI = X'* (A*X - RHS);
    InterestedColIdx=1;
%     hist_residual(ind+1,:) = [ind+1 norm(PHI(:,InterestedColIdx)) norm(X(:,InterestedColIdx))...
%         dot( X(:,InterestedColIdx), RHS(:,InterestedColIdx)) ...
%         dot( X(:,InterestedColIdx), R(:,InterestedColIdx))];
    hist_residual(ind+1,:) = [ind+1 sum(abs(diag(PHI))) norm(X(:,InterestedColIdx))...
        dot( X(:,InterestedColIdx), RHS(:,InterestedColIdx)) ...
        abs(dot( X(:,InterestedColIdx), R(:,InterestedColIdx)))];
    
end
end
