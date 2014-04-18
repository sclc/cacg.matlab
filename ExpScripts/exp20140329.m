function  exp20140329()
% main function for experiment on 2014-03-29

matrixPath = 'C:\MStore\mesh2e1.mtx';
[A,rows,cols,entries,rep,field,symm] = mmread(matrixPath);

% blockSize = 3;
% RHS = rand(rows,blockSize);
rhs_prefix = 'C:\ws.MatlabProj\ExpData\mesh2e1_';
rhs_suffix = '.csv';
maxIter = 10;
tol = 1e-4;

for block_size =1:2
X = ones(rows,block_size);
rhs_name = strcat(rhs_prefix ,int2str(block_size) ,rhs_suffix);
RHS = csvread(rhs_name);
[res,hist_residual] = bcg_1( A, RHS, X, maxIter, tol );
clear X;
clear RHS;

end

end
