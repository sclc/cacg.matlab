function [X,hist_residual] = bcg_1( A, RHS, X, maxIter, tol )
% bcg_1 Summary of this function goes here
% Detailed explanation goes here
% A is sparse matrix
% X, RHS are dense matrix
% matIter are the max number of iteration 
% tol is the breaking criteria, it will be compared to 
%     relative residual |r|/|b|
%    RColInd = 1;
%    RHSColInd = 1;
    R = RHS - A * X;
%    hist_residual(1,:)=[RelativeErrorCal(R, RHS, RColInd, RHSColInd)];
    hist_residual(1, :) = [0,RelativeErrorCal(R, RHS , 1, 1)];
    %fprintf ('first residual norm = %20.16f\n', hist_residual(1,1));
    Rtranspose_R= R' * R;
    P=R;
    for i = 1:maxIter
        AP = A * P;
        Ptranspose_AP = P' * AP;
        ALPHA = Ptranspose_AP\Rtranspose_R;
        X = X + P * ALPHA;
        R = R - AP * ALPHA;
        
        Rtranspose_R_next = R' * R;
        
%        hist_residual(i+1,:) = [RelativeErrorCal(R, RHS, RColInd, RHSColInd)];
        hist_residual(i+1, :) = [i, RelativeErrorCal(R, RHS , 1, 1)];
        if hist_residual(i+1,2) < tol
        %    fprintf ('final norm is %dth = %20.16f\n',i,hist_residual(i+1,1));
            return;
        end
        
        BETA = Rtranspose_R \ Rtranspose_R_next;
        P = R + P * BETA;
        
        Rtranspose_R = Rtranspose_R_next;
    %    fprintf ('%dth = %20.16f\n', i,hist_residual(i+1,1));
    end


end

