function exp20150510(machineId, matrixName, eigenMax, eigenMin, expId)
% main function for experiment on 2016-03-05
% windows on mac machine id = 0
% linux   machine id = 1
% windows at home id = 2
% matrixName: string
% rhsDistType: string
% command call example: exp20140708_mac(0, 'nasa4704', 'uniform',0.1,0.1,1)
addpath /home/scl/SkrGitRepo/cacg.matlab.git/KSMRoutines -end
addpath /home/scl/SkrGitRepo/cacg.matlab.git/tools -end

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
%%  boolComputEigen = true;
%%  matrixPath_foldername=strcat(matrixName,sepSym);
%%  matrixPath_filename=strcat( matrixName , '.mtx');
%%  matrixPath = strcat (matrixPath_root, matrixPath_foldername, matrixPath_filename);
%% matrixPath = '/home/scl/MStore/ex13/ex13.mtx'
%% matrixPath = '/home/scl/MStore/Chem97ZtZ/Chem97ZtZ.mtx'
 matrixPath = '/home/scl/MStore/nasa2910/nasa2910.mtx'
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
  maxIters = round(rows * 0.8);
  %maxIters = 10000;
  tol = 1e-15; 

  %%
%  for numCol=1:1
%      for s_k = 2:2%

% %        computingLabel = strcat(matrixName,'_bcg_noX','_s', int2str(s_k),'_b', int2str(numCol),' ... ...');%

% %        computingLabel = strcat(matrixName,'_bcbcg_noX','_s', int2str(s_k),'_b', int2str(numCol),' ... ...');
%         computingLabel = strcat(matrixName,'_bcbcg_1_1_noX','_s', int2str(s_k),'_b', int2str(numCol),' ... ...');
% 
% %        computingLabel = strcat(matrixName,'_cacg_monomial_1_noX','_s', int2str(s_k),'_b', int2str(numCol),' ... ...');
% %        computingLabel = strcat(matrixName,'_cacg_monomial_1_1_noX','_s', int2str(s_k),'_b', int2str(numCol),' ... ...');%

% %        computingLabel = strcat(matrixName,'_cacg_monomial_2_noX','_s', int2str(s_k),'_b', int2str(numCol),' ... ...');
% %        computingLabel = strcat(matrixName,'_cacg_monomial_2_1_noX','_s', int2str(s_k),'_b', int2str(numCol),' ... ...');
%          disp(computingLabel)
%          disp(boolComputEigen)
%          exp_section_1(maxIters, tol, matrixName, numCol, s_k);
%      end
%  end 

  %%

  computingLabel = strcat(matrixName,'_cg_test_1',' ... ...');
  disp(computingLabel)
  numCol = 1;
  s_k = 1; 
  exp_section_1(maxIters, tol, matrixName, numCol, s_k);
  % expFolder = strcat('..',sepSym, 'ExpScripts');
  % cd(expFolder)
%  clear all;
end
%%
function exp_section_1(maxIters, tol, matrixName, numCol, s_k)
    global A rows eigenvalueRepo eigenvectorRepo eigenFlagRepo boolComputEigen;
%%  precondtioning A
%  A = PC_Jacobi(A);
%%  test condtion number
%  disp(condest(A))
%  return;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% to get eigenvectors and eigenvalutes
%     z=100;
%      if boolComputEigen 
%      disp ('going to computate eigenvalues')
%       [eigenvectorRepo,eigenvalueRepo,eigenFlagRepo] = eigs(A,z,'lm');
%       boolComputEigen = false;
%      end
   % [zSmEigenvector, zSmEigenvalue,eigsSmFlag] = eigs(A,z,'sm');
%% to build mrhs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 2015-04-24 No.1: jacobi preconditioning
%  expId = 1;
%  A= PC_Jacobi(A);
%  x = zeros (rows,1);
%  rhs = rand (rows,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % 2015-04-24 No.2: 
 %expId = 2;
 %x = zeros (rows,1);
 %rhs = rand (rows,1);
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 2015-04-24 No.1: jacobi preconditioning
  expId = 3;
  A= PC_Jacobi(A);
  x = zeros (rows,1);
  rhs = rand (rows,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% call solver
%    [X,hist_residual] = bcg_1( A, RHS, X, maxIters, tol );

%    [X,hist_residual] = bcbcg_1(A, RHS, s_k, numCol, X, maxIters, tol);
    [x,hist_residual,hist_alpha_ratio] = cg_alpha_test_1( A, rhs, maxIters, tol );
%    [X,hist_residual] = cacg_monomial_1(A, RHS, s_k, numCol, X, maxIters, tol);
%    [X,hist_residual] = cacg_monomial_1_1(A, RHS, s_k, numCol, X, maxIters, tol);

%    [X,hist_residual] = cacg_monomial_2(A, RHS, s_k, numCol, X, maxIters, tol);
%    [X,hist_residual] = cacg_monomial_2_1(A, RHS, s_k, numCol, X, maxIters, tol);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% output data
    global outputDir ;
%    outputfilename= strcat(outputDir, matrixName,'_bcg_no',int2str(expId),'_s', int2str(s_k),'_b', int2str(numCol),'.csv');

%    outputfilename= strcat(outputDir, matrixName,'_bcbcg_no',int2str(expId),'_s', int2str(s_k),'_b', int2str(numCol),'.csv');
    outputfilename_residual   = strcat(outputDir, matrixName,'_cg_alpha_test_1_residual_no',  int2str(expId), '.csv');
    outputfilename_alpharatio = strcat(outputDir, matrixName,'_cg_alpha_test_1_alpharatio_no',int2str(expId), '.csv');

%    outputfilename= strcat(outputDir, matrixName,'_cacg_monomial_1_no',int2str(expId),'_s', int2str(s_k),'_b', int2str(numCol),'.csv');
%    outputfilename= strcat(outputDir, matrixName,'_cacg_monomial_1_1_no',int2str(expId),'_s', int2str(s_k),'_b', int2str(numCol),'.csv');

%    outputfilename= strcat(outputDir, matrixName,'_cacg_monomial_2_no',int2str(expId),'_s', int2str(s_k),'_b', int2str(numCol),'.csv');
%    outputfilename= strcat(outputDir, matrixName,'_cacg_monomial_2_1_no',int2str(expId),'_s', int2str(s_k),'_b', int2str(numCol),'.csv');
    csvwrite(outputfilename_residual, hist_residual);
    csvwrite(outputfilename_alpharatio, hist_alpha_ratio);
end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

