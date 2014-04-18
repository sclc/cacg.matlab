function  exp20140402()
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
maxIters = 10;
tol = 1e-4;
% 
for s_k =3:3
    x = ones(rows,1);
    rhs_name = strcat(rhs_prefix ,int2str(1) ,rhs_suffix);
    rhs = csvread(rhs_name);
    
    [x, hist_residual] = cbcg_1 (A, rhs, s_k, x, maxIters, tol);
% 
    clear x;
    clear rhs;
end

end
