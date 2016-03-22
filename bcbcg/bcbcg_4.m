%%%%%%%%%%%%%%%% start of function bcbcg_4()
function [X,hist_residual] = bcbcg_4(A, RHS, s_k, blocksize, X, eigenValue_max, eigenValue_min,maxIters, tol)
%%%%%%%% !
%	block chebyshev basis conjugat gradient
%	inherited from bchcg_1, however, now we get eigenValue_max and
%	eigenValue_min from arguments rahter than call gerschgorin_1(A)
%	hist_residual contans : norm ( 0.5*X'AX - X'RHS)
% input
%	A  	  : sparse linear system
%	RHS	  : B in AX=B
%	s_k	  : step value defined as in s-step method
%	blocksize : column of right-hand side B
%	X	  : matrix as defined in AX=B
%	maxIters  : iteration stops at the value of loops
%	tol	  : convergence criteria
%	eigenValue_max : maximum eigenvalue estimation of A
%	eigenValue_min : minimum eigenvalue estimation of A
% output
%	X	  : result of the unknowns
%
%%%%%%%%
s_alpha = 2.0 / (eigenValue_max - eigenValue_min);
s_beta  = - (eigenValue_max + eigenValue_min) / (eigenValue_max - eigenValue_min);

%%%%%%%%
R = RHS - A*X;
% PHI = X'* (0.5 * A * X - RHS);
InterestedColIdx=1;

% hist_residual(1,:) = [1 norm(PHI(:,InterestedColIdx)) norm(X(:,InterestedColIdx)) ...
%     dot( X(:,InterestedColIdx), RHS(:,InterestedColIdx)) ...
%     dot( X(:,InterestedColIdx), R(:,InterestedColIdx))];

% hist_residual(1,:) = [1 sum(abs(diag(PHI))) norm(X(:,InterestedColIdx)) ...
%    dot( X(:,InterestedColIdx), RHS(:,InterestedColIdx)) ...
%    abs(dot( X(:,InterestedColIdx), R(:,InterestedColIdx)))];

    hist_residual(1, :) = [0,RelativeErrorCal(R, RHS , 1, 1)];

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
%    for dimInd = 1:s_k
%        if dimInd == 1
%            SS(:, 1:blocksize) = R;
%        elseif dimInd == 2
%            SS (:, blocksize+1:blocksize*2) = A * R;
%        else
%            SS(:, blocksize*(dimInd-1)+1:blocksize*dimInd) = 2 * A * SS(:, blocksize*(dimInd -2)+1:blocksize*(dimInd -1)) ...
%                - SS(:, blocksize*(dimInd -3)+1:blocksize*(dimInd -2));
%        end
%    end

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
    %whos
    Qtran_A_Q_inv = inv(Qtran_A_Q);
    para_alpha = Qtran_A_Q_inv * Q'* R;
    
    % update x
    X = X + Q * para_alpha;
    R = R - A_Q * para_alpha;
   % PHI = X'* (0.5*A*X - RHS);
    R_check = RHS - A*X;
    InterestedColIdx=1;
%     hist_residual(ind+1,:) = [ind+1 norm(PHI(:,InterestedColIdx)) norm(X(:,InterestedColIdx))...
%         dot( X(:,InterestedColIdx), RHS(:,InterestedColIdx)) ...
%         dot( X(:,InterestedColIdx), R(:,InterestedColIdx))];
%    hist_residual(ind+1,:) = [ind+1 sum(abs(diag(PHI))) norm(X(:,InterestedColIdx))...
%        dot( X(:,InterestedColIdx), RHS(:,InterestedColIdx)) ...
%        abs(dot( X(:,InterestedColIdx), R(:,InterestedColIdx)))];
    
	residual_temp = RelativeErrorCal(R_check, RHS , 1, 1);
        hist_residual(ind+1, :) = [ind, residual_temp];
	
	if (residual_temp < tol)
		break
	end
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%% end of function bcbcg_4
