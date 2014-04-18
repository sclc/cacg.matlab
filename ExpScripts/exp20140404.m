function  exp20140404()
% main function for experiment on 2014-03-29

% matrixPath = 'C:\MStore\mesh2e1.mtx';
matrixPath = 'C:\MStore\bcsstk27.mtx';
[A,rows,cols,entries,rep,field,symm] = mmread(matrixPath);
% [eigen_max, eigen_min] = gerschgorin_1(A);
% % sprintf('%f,%f\n', eigen_max,eigen_min)

% % blockSize = 3;
% % RHS = rand(rows,blockSize);
% rhs_prefix = 'C:\ws.MatlabProj\ExpData\mesh2e1_';
rhs_prefix = 'C:\ws.MatlabProj\ExpData\bcsstk27_';
rhs_suffix = '.csv';
maxIters = 20;
tol = 1e-4;
%
for blocksize = 3:3
    for s_k =3:3
        X = ones(rows,blocksize);
        rhs_name = strcat(rhs_prefix ,int2str(blocksize) ,rhs_suffix);
        RHS = csvread(rhs_name);
        
        [X, hist_residual] = bcbcg_1(A, RHS, s_k, blocksize, X, maxIters, tol);
        %
        clear X;
        clear RHS;
    end
end

end
