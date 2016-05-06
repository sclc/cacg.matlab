function exp20150510(machineId, matrixName, eigenMax, eigenMin, expId)
% main function for experiment on 2014-10-15
% windows on mac machine id = 0
% linux   machine id = 1
% windows at home id = 2
% matrixName: string
% rhsDistType: string
% command call example: exp20140708_mac(0, 'nasa4704', 'uniform',0.1,0.1,1)
addpath /home/scl/github.projs/cacg.matlab/KSMRoutines -end 
addpath /home/scl/github.projs/cacg.matlab/cg -end 
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
  maxIters = 3;
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
%% call solver

    [x,hist_residual] = cg( A, x, rhs, maxIters, tol );
    hist_residual
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

