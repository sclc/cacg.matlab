% main function 

matrixPath = 'C:\MStore\mesh2e1.mtx';
[A,rows,cols,entries,rep,field,symm] = mmread(matrixPath);
rhs = ones(rows,1);

maxIter = 20;
tol = 1e-4;
[x,hist_residual] = cg_code( A, rhs, maxIter, tol );