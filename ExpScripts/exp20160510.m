function exp20160510(machineId, matrixName, eigenMax, eigenMin, expId)
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
addpath /home/scl/SkrGitRepo/cacg.matlab.git/cbcg -end
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
  computingLabel = strcat(matrixName,'_bcbcg_4',' ... ...');
  disp(computingLabel)
  numCol = 1;
  s_k = 1; 
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
%2016-05-10
%[eigenvalue_max, eigenvalue_min] = gerschgorin_1(A);
%format long, disp(eigenvalue_max)
%format long, disp(eigenvalue_min)
%return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2016-05-10
%tol=1e-5;
%y=rand(rows,1);
%it_max = 200;
%[ y, lambda, it_num ] = power_iteration_1 ( rows, A, y, it_max, tol );
%format long, disp(lambda)
%
%A_shift = A - lambda*eye(rows);
%y_shift=rand(rows,1);
%[ y_shift, lambda_shift, it_num ] = power_iteration_1 ( rows, A_shift, y_shift, it_max, tol );
%lambda_shift_real = lambda_shift+lambda;
%format long, disp(lambda_shift_real)
%
%eigs(A,3,'sm')
%return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % 2016-03-06 No.1: 
	X = zeros (rows,1);
	RHS = rand (rows,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% ! call solver
	s_k=6;
	numCol=1;
	debug = 0;
	if (debug)
		disp ('s_k')
		isinteger(s_k)

		disp ('numCol')
		isinteger(numCol)

		disp ('maxIters')
		isinteger(maxIters)

		disp ('tol')
		isinteger (tol)
	end
real eigen

   	global outputDir ;
%%%%
%% 1138_bus 
% 	 real eigen: 3.01487e+04,  0.00351686
%	gerog      : 4.03667e+04, -0.00500400 
%	power iter : 3.00176e+04 , 59.6707933
%%%%

%% 1138_bus 
%% http://www.cise.ufl.edu/research/sparse/matrices/HB/1138_bus.html
	eigens = [3.01487e+04, 0.00351686; 4.03667e+04, 0.0; 3.00176e+04, 6.51141; 3.00176e+04, 0.0];

	for idx=1:4
		expId=idx;
		X = zeros (rows,1);
		[X,hist_residual] = bcbcg_4(A, RHS, s_k, numCol, X, eigens(idx,1), eigens(idx,2), maxIters, tol);
    		outputfilename= strcat(outputDir, matrixName,'_bcbcg_4_no',int2str(expId),'_s', int2str(s_k),'_b', int2str(numCol),'.csv');
    		disp (outputfilename)
    		csvwrite(outputfilename, hist_residual);
	end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% output data

end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% end of function exp_section_1

