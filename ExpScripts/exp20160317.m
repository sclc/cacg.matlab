function exp20160317(machineId, matrixName, eigenMax, eigenMin, expId)
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
  s_k = 6; 
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
 % 2016-03-06 No.1: 
	X = zeros (rows,1);
	RHS = rand (rows,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% ! call solver
	debug = 1;
	if (debug)
		disp ('s_k')
		isinteger(s_k)
		disp (s_k)

		disp ('numCol')
		isinteger(numCol)
		disp (numCol)
		

		disp ('maxIters')
		isinteger(maxIters)
		disp (maxIters)

		disp ('tol')
		isinteger (tol)
		disp (tol)
	end
real eigen

   	global outputDir ;
%%%%
%% Chem97ZtZ
% 	 real eigen: 
%	gerog      : 
%	power iter : 
%%%%

%% Chem97ZtZ
%% power iteration
%	eigens = [ 1.3315e+03, 5.3982; 2.2870e+03, 4.4197; 1.3292e+03, 25.1447];
%% power iteration
	eigens = [ 1.3315e+03, 5.3982; 2.2870e+03, 4.4197; 1.3292e+03, 4.4197];

%% http://www.cise.ufl.edu/research/sparse/matrices/Nasa/nasa2146.html
%% power iteration
%	eigens = [ 1.0e+07 *3.2728, 1.0e+04 * 2.4183; 4.1984e+07, 0 ; 3.2468e+07, 8.4059e+05];
%% power iteration + gerschgorin
%	eigens = [ 1.0e+07 *3.2728, 1.0e+04 * 2.4183; 4.1984e+07, 0 ; 3.2468e+07, 0];


%% http://www.cise.ufl.edu/research/sparse/matrices/Boeing/crystm01.html
%% power iteration
%	eigens = [ 1.0e-11 * 0.5306,1.0e-13 * 0.2324; 6.0298e-12, 0 ; 5.3040e-12, 1.0987e-12];
%% power iteration + gerschgorin
%	eigens = [ 1.0e-11 * 0.5306,1.0e-13 * 0.2324; 6.0298e-12, 0 ; 5.3040e-12, 0];

	disp (eigens)

	for idx=1:3
		%expId=idx;
		expId=idx+3;
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

