function exp20160516(machineId, matrixName, eigenMax, eigenMin, expId)
% main function for experiment on 2014-10-15
% windows on mac machine id = 0
% linux   machine id = 1
% windows at home id = 2
% matrixName: string
% rhsDistType: string
% command call example: exp20140708_mac(0, 'nasa4704', 'uniform',0.1,0.1,1)
addpath /home/scl/github.projs/cacg.matlab/KSMRoutines -end 
addpath /home/scl/github.projs/cacg.matlab/cg -end 
addpath /home/scl/github.projs/cacg.matlab/bcg -end 
addpath /home/scl/github.projs/cacg.matlab/cbcg -end 
addpath /home/scl/github.projs/cacg.matlab/bcbcg -end 
addpath /home/scl/github.projs/cacg.matlab/tools -end 

%%
  if machineId == 0
      sepSym = '\';
  elseif machineId == 1
      sepSym = '/';
  elseif machineId == 2
      sepSym = '\';
  end
  %%
  if machineId == 0
      matrixPath_root='Y:\';
  elseif machineId == 1
      matrixPath_root='/home/scl/MStore/';
  elseif machineId == 2
      matrixPath_root='E:\MStore\';
  end 

  %%
  global A rows cols eigenvalueRepo eigenvectorRepo eigenFlagRepo boolComputEigen;
  boolComputEigen = true;
  matrixPath_foldername=strcat(matrixName,sepSym);
  matrixPath_filename=strcat( matrixName , '.mtx');
  matrixPath = strcat (matrixPath_root, matrixPath_foldername, matrixPath_filename);
  [A,rows,cols,entries,rep,field,symm] = mmread(matrixPath);  

  %%
  global eigenValue_max eigenValue_min;
  eigenValue_max = eigenMax;
  eigenValue_min = eigenMin;  

  %%
  global outputDir;
  if machineId == 0
      outputDir = 'X:\ExperimentalDataTemp\';
  elseif machineId == 1
      outputDir = '/home/scl/ExpDataTemp/';
  elseif machineId == 2
      outputDir = 'E:\workspace\CAKSMsMatlabProj\ExperimentalDataTemp\';
  end
  %%    
  maxIters = 20;
  %maxIters = 10000;
  tol = 1e-15; 

  computingLabel = strcat(matrixName,'_cg',' ... ...');
  disp(computingLabel)
  numCol = 1;
  s_k=1;
  exp_section_1(maxIters, tol, matrixName, numCol, s_k);
  % expFolder = strcat('..',sepSym, 'ExpScripts');
  % cd(expFolder)
%  clear all;
end
%%
function exp_section_1(maxIters, tol, matrixName, numCol, s_k)
    global A rows eigenvalueRepo eigenvectorRepo eigenFlagRepo boolComputEigen;
  x = ones (rows,1);
  rhs = ones (rows,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
it_max = 1000
tol = 1e-4
[ y, lambda, it_num ] = power_iteration_1 ( rows, A, x, it_max, tol );
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% call solver

    %[x,hist_residual] = cg( A, x, rhs, maxIters, tol );
    %hist_residual
    %fprintf('res:%f\n',dot(x,x))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
	%[max_eigen_estimation,min_eigen_estimation] = gerschgorin_1 (A)
	%fprintf('max_eigen_estimation:%f min_eigen_estimation:%f\n', max_eigen_estimation, min_eigen_estimation)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	 b=ones(rows,1);
%	 s_k=5
%	 chebyshev_basis_generation (A, b, s_k);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%b=ones(rows,1)
  	%x = ones (rows,1);
	%[result, hist_residual] = cbcg_1(A, b, 1, x,5, tol);
	%disp (hist_residual)
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%b=csvread('/home/scl/tmp/rhs.csv');
	%[b_rows,b_col] = size(b);
	%x=ones(rows,b_col);
	%maxIter=3
	%[X,hist_residual] = bcg_1( A, b, x, maxIter, tol );
	%%bcg_db( A, b, x, maxIter, tol );
	%format long, disp(hist_residual)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%b=csvread('/home/scl/tmp/rhs.csv');
	%[b_rows,b_col] = size(b);
	%x=ones(rows,b_col);
	%disp(b_col)
	%disp(b_rows)
	%maxIters=3;
	%s_k = 5;
	%tol = 1e-10
	%%[eigenValue_max,eigenValue_min] = gerschgorin_1(A);
	%%[X,hist_residual] = bcbcg_4(A, b, s_k, b_col, x, eigenValue_max, eigenValue_min, maxIters, tol);
	%[result, hist_residual] = cbcg_1(A, b, s_k, x, maxIters, tol);
	%format long, disp(hist_residual)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% output data
    global outputDir ;
%    outputfilename= strcat(outputDir, matrixName,'_bcg_no',int2str(expId),'_s', int2str(s_k),'_b', int2str(numCol),'.csv');

%    outputfilename= strcat(outputDir, matrixName,'_bcbcg_no',int2str(expId),'_s', int2str(s_k),'_b', int2str(numCol),'.csv');
%    outputfilename_residual   = strcat(outputDir, matrixName,'_cg_alpha_test_1_residual_no',  int2str(expId), '.csv');
%    outputfilename_alpharatio = strcat(outputDir, matrixName,'_cg_alpha_test_1_alpharatio_no',int2str(expId), '.csv');

%    outputfilename= strcat(outputDir, matrixName,'_cacg_monomial_1_no',int2str(expId),'_s', int2str(s_k),'_b', int2str(numCol),'.csv');
%    outputfilename= strcat(outputDir, matrixName,'_cacg_monomial_1_1_no',int2str(expId),'_s', int2str(s_k),'_b', int2str(numCol),'.csv');

%    outputfilename= strcat(outputDir, matrixName,'_cacg_monomial_2_no',int2str(expId),'_s', int2str(s_k),'_b', int2str(numCol),'.csv');
%    outputfilename= strcat(outputDir, matrixName,'_cacg_monomial_2_1_no',int2str(expId),'_s', int2str(s_k),'_b', int2str(numCol),'.csv');
%    csvwrite(outputfilename_residual, hist_residual);
%    csvwrite(outputfilename_alpharatio, hist_alpha_ratio);
end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

