function exp20160318(machineId, matrixName, eigenMax, eigenMin, expId)

% main function for experiment on 2016-03-06
% windows on mac machine id = 0
% linux   machine id = 1
% windows at home id = 2
% matrixName: string
% rhsDistType: string
% command call example: exp20140708_mac(0, 'nasa4704', 'uniform',0.1,0.1,1)

addpath /home/scl/SkrGitRepo/cacg.matlab.git/KSMRoutines -end
addpath /home/scl/SkrGitRepo/cacg.matlab.git/tools -end
addpath /home/scl/SkrGitRepo/cacg.matlab.git/bcbcg -end
addpath /home/scl/SkrGitRepo/cacg.matlab.git/cg -end
addpath /home/scl/SkrGitRepo/cacg.matlab.git/bcg -end

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
  global A rows cols eigenvalueRepo eigenvectorRepo eigenFlagRepo boolComputEigen eigenValue_max eigenValue_min;
%%  boolComputEigen = true;
  matrixPath_foldername=strcat(matrixName,sepSym);
  matrixPath_filename=strcat( matrixName , '.mtx');
  matrixPath = strcat (matrixPath_root, matrixPath_foldername, matrixPath_filename);
  [A,rows,cols,entries,rep,field,symm] = mmread(matrixPath);  

  %%
  global eigenValue_max eigenValue_min;
  eigenValue_max = eigs(A,1, 'lm');
  eigenValue_min = eigs(A,1, 'sm');  

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
  maxIters = round(rows * 0.5);
  %maxIters = 10000;
  tol = 1e-12; 

%%%%%%%%%%% comment out
  %%
%  for numCol=1:1
%      for s_k = 2:2%

%         computingLabel = strcat(matrixName,'_bcbcg_noX','_s', int2str(s_k),'_b', int2str(numCol),' ... ...');
%         computingLabel = strcat(matrixName,'_bcbcg_1_1_noX','_s', int2str(s_k),'_b', int2str(numCol),' ... ...');
% 
%          disp(computingLabel)
%          disp(boolComputEigen)
%          exp_section_1(maxIters, tol, matrixName, numCol, s_k);
%      end
%  end 

%%%%%%%%%%%
%  computingLabel = strcat(matrixName,'_bcbcg_4',' ... ...');
%  disp(computingLabel)
  numCol = 20;
  s_k = 6; 
   disp ('calling exp_section_1')
  exp_section_1(maxIters, tol, matrixName, numCol, s_k);

end
%%
%%%%%%%%%%%%%%%%%%% end of function exp20160306()

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  start of function exp_section_1 ()
function exp_section_1(maxIters, tol, matrixName, numCol, s_k)
  
	global A rows cols eigenvalueRepo eigenvectorRepo eigenFlagRepo boolComputEigen eigenValue_max eigenValue_min;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% ! precondtioning A
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
%    [zSmEigenvector, zSmEigenvalue,eigsSmFlag] = eigs(A,z,'sm');
%% to build mrhs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % 2015-04-24 No.2: 
 %expId = 2;
 %x = zeros (rows,1);
 %rhs = rand (rows,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 2015-04-24 No.1: jacobi preconditioning
%  expId = 3;
%  A= PC_Jacobi(A);
%  x = zeros (rows,1);
%  rhs = rand (rows,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % 2016-03-18 No.1: 

  	numCol = 20;
	RHS = rand (rows,numCol);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% ! call solver
	debug = 1;
	if (debug)
		disp ('maxIters')
		disp (maxIters)

		disp ('tol')
		disp (tol)

		disp ('eigenValue_max')
		disp (eigenValue_max)

		disp ('eigenValue_min')
		disp (eigenValue_min)
	end

   	global outputDir ;
%%%%
expId = 1;

%%%%%%%%%%%% cg
	computingLabel = strcat(matrixName,'_bcg',' m1 ... ...');
	disp(computingLabel)

        idx_col_size=1;
	%clear hist_residual;
	X = zeros(rows,idx_col_size);
	[X,hist_residual] = bcg_1( A, RHS(: , 1:idx_col_size), X(: , 1:idx_col_size), maxIters, tol );
    	outputfilename= strcat(outputDir, matrixName,'_bcg_1_no',int2str(expId),'_m', int2str(idx_col_size),'.csv');
    	disp (outputfilename)
    	csvwrite(outputfilename, hist_residual);

%%%%%%%%%%% bcg m12
	computingLabel = strcat(matrixName,'_bcg_1',' m12 ... ...');
	disp(computingLabel)

        idx_col_size=12;
	clear hist_residual;
	clear X;
	X = zeros(rows,idx_col_size);
	[X,hist_residual] = bcg_1( A, RHS(: , 1:idx_col_size), X(: , 1:idx_col_size), maxIters, tol );
    	outputfilename= strcat(outputDir, matrixName,'_bcg_1_no',int2str(expId),'_m', int2str(idx_col_size),'.csv');
    	disp (outputfilename)
    	csvwrite(outputfilename, hist_residual);

%%%%%%%%%%%% bcbcg m1, s2
	computingLabel = strcat(matrixName,'_bcbcg_4',' m1, s2 ... ...');
	disp(computingLabel)

	s_k=2;
        idx_col_size=1;
	clear hist_residual;
	clear X;
	X = zeros(rows,idx_col_size);
	[X,hist_residual] = bcbcg_4(A, RHS(:,1:idx_col_size), s_k, idx_col_size, X(:,1:idx_col_size), eigenValue_max, eigenValue_min, maxIters, tol);
    	outputfilename= strcat(outputDir, matrixName,'_bcbcg_4_no',int2str(expId),'_s', int2str(s_k),'_m', int2str(idx_col_size),'.csv');
    	disp (outputfilename)
    	csvwrite(outputfilename, hist_residual);
%%%%%%%%%%%% bcbcg m1, s6
	computingLabel = strcat(matrixName,'_bcbcg_4',' m1, s6 ... ...');
	disp(computingLabel)

	s_k=6;
        idx_col_size=1;
	clear hist_residual;
	clear X;
	X = zeros(rows,idx_col_size);
	[X,hist_residual] = bcbcg_4(A, RHS(:,1:idx_col_size), s_k, idx_col_size, X(:,1:idx_col_size), eigenValue_max, eigenValue_min, maxIters, tol);
    	outputfilename= strcat(outputDir, matrixName,'_bcbcg_4_no',int2str(expId),'_s', int2str(s_k),'_m', int2str(idx_col_size),'.csv');
    	disp (outputfilename)
    	csvwrite(outputfilename, hist_residual);
%%%%%%%%%%%% bcbcg m6, s2
	computingLabel = strcat(matrixName,'_bcbcg_4',' m6,s2 ... ...');
	disp(computingLabel)

	s_k=2;
        idx_col_size=6;
	clear hist_residual;
	clear X;
	X = zeros(rows,idx_col_size);
	[X,hist_residual] = bcbcg_4(A, RHS(:,1:idx_col_size), s_k, idx_col_size, X(:,1:idx_col_size), eigenValue_max, eigenValue_min, maxIters, tol);
    	outputfilename= strcat(outputDir, matrixName,'_bcbcg_4_no',int2str(expId),'_s', int2str(s_k),'_m', int2str(idx_col_size),'.csv');
    	disp (outputfilename)
    	csvwrite(outputfilename, hist_residual);
%%%%%%%%%%%% bcbcg m6, s6
	computingLabel = strcat(matrixName,'_bcbcg_4',' m6,s6 ... ...');
	disp(computingLabel)

	s_k=6;
        idx_col_size=6;
	clear hist_residual;
	clear X;
	X = zeros(rows,idx_col_size);
	[X,hist_residual] = bcbcg_4(A, RHS(:,1:idx_col_size), s_k, idx_col_size, X(:,1:idx_col_size), eigenValue_max, eigenValue_min, maxIters, tol);
    	outputfilename= strcat(outputDir, matrixName,'_bcbcg_4_no',int2str(expId),'_s', int2str(s_k),'_m', int2str(idx_col_size),'.csv');
    	disp (outputfilename)
    	csvwrite(outputfilename, hist_residual);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% end of function exp_section_1

