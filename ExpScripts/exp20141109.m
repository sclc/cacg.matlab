function exp20141109(machineId, matrixName, eigenMax, eigenMin, expId)
% main function for experiment on 2014-10-15
% windows on mac machine id = 0
% linux   machine id = 1
% windows at home id = 2
% matrixName: string
% rhsDistType: string
% command call example: exp20140708_mac(0, 'nasa4704', 'uniform',0.1,0.1,1)
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
global A rows cols;
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
maxIters = 5000;
tol = 1e-8;

%%
for numCol=1:4
    for s_k = 1:3
        computingLabel = strcat(matrixName,'_bcbcg_noX','_s', int2str(s_k),'_b', int2str(numCol),' ... ...');
        disp(computingLabel)
        exp_section_1(maxIters, tol, matrixName, numCol, s_k);
    end
end

%%
% expFolder = strcat('..',sepSym, 'ExpScripts');
% cd(expFolder)
end
%%
function exp_section_1(maxIters, tol, matrixName, numCol, s_k)
    global A rows;
%% to get eigenvectors and eigenvalutes
     z=250;
     [zEigenvector, zEigenvalue,eigsFlag] = eigs(A,z,'lm');
     % [zSmEigenvector, zSmEigenvalue,eigsSmFlag] = eigs(A,z,'sm');
%% to build mrhs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 2014-11-09 No.1: 
% % X_0 = RHS
 % expId = 1;
 % numCol = 10;
 % RHS = rand (rows,numCol);
 % s_k = 1;
 % X=RHS;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 2014-11-09 No.2: 
% % X_0 = random values
     % expId = 2;
     % numCol = 10;
     % RHS = rand (rows,numCol);
     % s_k = 1;
     % X= rand (rows,numCol);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 2014-11-09 No.3: 
% % X_0 = RHS
 % expId = 3;
 
 % numSection = 10;
 % %% shuffle eigenvectors in random order
 % order = randperm(z);
 % zEigenvectorShuffled = zEigenvector(:,order);

 
 % assert(numCol*numSection <= z, ...
 %     'we do not have enough calculated eigenvectors');

 % RHS = zeros (rows,numCol);
 % for NumRhsColCounter = 1: numCol
 %     for NumSectionCounter = 1:numSection
 %         RHS (:, NumRhsColCounter) = RHS (:, NumRhsColCounter) + ...
 %             rand() * zEigenvectorShuffled(:, numSection * (NumRhsColCounter - 1) + NumSectionCounter);
 %     end
 % end

 % X= RHS;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 2014-11-09 No.4: 
% % X_0 = RHS
 % expId = 4;
 
 % numSection = z;
 % %% shuffle eigenvectors in random order
 % order = randperm(z);
 % zEigenvectorShuffled = zEigenvector(:,order);

 
 % assert(numSection <= z, ...
 %     'we do not have enough calculated eigenvectors');

 % RHS = zeros (rows,numCol);
 % for NumRhsColCounter = 1: numCol
 %     for NumSectionCounter = 1:numSection
 %         RHS (:, NumRhsColCounter) = RHS (:, NumRhsColCounter) + ...
 %             rand() * zEigenvectorShuffled(:, NumSectionCounter);
 %     end
 % end

 % X= zeros (rows,numCol);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 2014-11-09 No.5: 
% % X_0 = zeros
  expId = 5;

  numSection = 10;
  %% shuffle eigenvectors in random order
  order = randperm(z);
  zEigenvectorShuffled = zEigenvector(:,order);

  assert(numCol*numSection <= z, ...
      'we do not have enough calculated eigenvectors');
  RHS = zeros (rows,numCol);
  for NumRhsColCounter = 1: numCol
      for NumSectionCounter = 1:numSection
          RHS (:, NumRhsColCounter) = RHS (:, NumRhsColCounter) + ...
              rand() * zEigenvectorShuffled(:, numSection * (NumRhsColCounter - 1) + NumSectionCounter);
      end
  end
  X= zeros (rows,numCol);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    [X,hist_residual] = bcbcg_1(A, RHS, s_k, numCol, X, maxIters, tol);
    %% output data
    global outputDir ;
    outputfilename= strcat(outputDir, matrixName,'_bcbcg_no',int2str(expId),'_s', int2str(s_k),'_b', int2str(numCol),'.csv');
    csvwrite(outputfilename, hist_residual);
end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

