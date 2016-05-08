function [] = chebyshev_basis_generation (A, b, s_k)
%% cbcg function 1st version
    [eigenValue_max, eigenValue_min] = gerschgorin_1(A);
    disp(eigenValue_min)
    disp(eigenValue_max)

    s_alpha = 2.0 / (eigenValue_max - eigenValue_min);
    s_beta  = - (eigenValue_max + eigenValue_min) / (eigenValue_max - eigenValue_min);

    r=b;
    %hist_residual(1, :) = RelativeErrorCal(r, b , 1, 1);
    for ind = 1:1
        %% generate s_k dim subspace
        s_k = uint32(s_k);
        for dimInd = 1:s_k
            if dimInd == 1
                SS(:, 1) = r;
            elseif dimInd == 2
                SS (:, 2) = s_alpha * A * r + s_beta * r;
            else
                SS(:, dimInd) = 2 * s_alpha * A * SS(:, dimInd -1) ...
                    + 2 * s_beta * SS(:,dimInd-1) - SS(:,dimInd-2);
            end           
        end
	disp(5000*SS)
%        %% A-orthogonalization 
%        if ind == 1
%            Q = SS;
%        else
%            Qtran_A_SS = A_Q' * SS;
%            B = Qtran_A_Q_inv * Qtran_A_SS;
%            Q = SS - Q * B;
%        end
%        
%        %% get parameter to update x
%        A_Q = A * Q;
%        Qtran_A_Q = Q' * A_Q;
%        Qtran_A_Q_inv = inv(Qtran_A_Q);
%        para_alpha = Qtran_A_Q_inv * Q'* r;
%        
%        %% update x
%        x = x + Q * para_alpha;
%        r = r - A_Q * para_alpha;
%        hist_residual(ind+1, :) = RelativeErrorCal(r, b , 1, 1);
        
      
    end

end
