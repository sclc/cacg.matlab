function  exp20140402()
% main function for experiment on 2014-03-29

matrixPath = 'C:\MStore\mesh2e1.mtx';
% matrixPath = 'C:\MStore\bcsstk27.mtx';
[A,rows,cols,entries,rep,field,symm] = mmread(matrixPath);
[eigen_max, eigen_min] = gerschgorin_1(A);
% sprintf('%f,%f\n', eigen_max,eigen_min)

% % blockSize = 3;
% % RHS = rand(rows,blockSize);
% rhs_prefix = 'C:\ws.MatlabProj\ExpData\mesh2e1_';
% rhs_suffix = '.csv';
% maxIter = 10;
% tol = 1e-4;
% 
% for block_size =1:2
% X = ones(rows,block_size);
% rhs_name = strcat(rhs_prefix ,int2str(block_size) ,rhs_suffix);
% RHS = csvread(rhs_name);
% 
% clear X;
% clear RHS;
% 
% end

end
