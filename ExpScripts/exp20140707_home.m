function exp20140707_home(machineId, matrixName, rhsDistType,eigenMax, eigenMin, expId)
% main function for experiment on 2014-03-29
% windows on mac machine id = 0
% linux   machine id = 1
% windows at home id = 2
% matrixName: string
% rhsDistType: string
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
    outputDir = '/home/scl/caExpStore/';
elseif machineId == 2
    outputDir = 'E:\workspace\CAKSMsMatlabProj\ExperimentalDataTemp\';
end
%%    
maxIters = 5000;
tol = 1e-6;
%%
exp_1(maxIters, tol);
%%
% expFolder = strcat('..',sepSym, 'ExpScripts');
% cd(expFolder)
end
%%
function exp_1(maxIters, tol)
    global A rows;
%% to get eigenvectors and eigenvalutes
    z=200;
    [zEigenvector, zEigenvalue,eigsFlag] = eigs(A,z,'lm');
    [zSmEigenvector, zSmEigenvalue,eigsSmFlag] = eigs(A,z,'sm');
%% to build mrhs
% No.1:
%     expId = 1;
%     numCol = 5;
%     RHS = zEigenvector (:,1:numCol);
%     X   = zEigenvector (:,numCol+1:2*numCol);
% No.2:
%     expId = 2;
%     numCol = 10;
%     RHS = zEigenvector (:,1:numCol);
%     X   = rand (rows,numCol);
% No.3: random mrhs, random X
%     expId = 3;
%     numCol = 10;
%     RHS = rand (rows,numCol);
%     X   = rand (rows,numCol);
% No.4: linear combination of eigenvectors, no overlapping
%       random initial X
%     expId = 4;
%     numSection = 2;
%     numCol = 2;
%     assert(numCol*numSection <= z, ...
%         'we do not have enough calculated eigenvectors');
%     RHS = zeros (rows,numCol);
%     for NumRhsColCounter = 1: numCol
%         for NumSectionCounter = 1:numSection
%             RHS (:, NumRhsColCounter) = RHS (:, NumRhsColCounter) + ...
%                 zEigenvector(:, numSection * (NumRhsColCounter - 1) + NumSectionCounter);
%         end
%     end
%     X   = rand (rows,numCol);
% % No.5: linear combination of eigenvectors, no overlapping
% %       eigenvector as initial X
% % if division > numSection, floor() return 0
% % imp
    expId = 5;
    numSection = 20;
    numCol = 5;
    division = 50;
    assert(numCol*numSection <= z, ...
        'we do not have enough calculated eigenvectors');
    RHS = zeros (rows,numCol);
    for NumRhsColCounter = 1: numCol
        for NumSectionCounter = 1:numSection
%             RHS (:, NumRhsColCounter) = RHS (:, NumRhsColCounter) + ...
%                 zEigenvector(:, max(0, numSection * (NumRhsColCounter - 2) + ... 
%                 floor(numSection/division)) +  NumSectionCounter);
            RHS (:, NumRhsColCounter) = RHS (:, NumRhsColCounter) + ...
                zEigenvector(:, max(0, numSection * (NumRhsColCounter - 1) - ... 
                floor(numSection/division)) +  NumSectionCounter); 
        end
    end
%     X   = zEigenvector (:,1:numCol);
    X   = zEigenvector (:,(numSection * numCol+1):(numCol+ numSection * numCol));
%     X   = zEigenvector (:,(numSection * numCol+100+1):(numCol+ numSection * numCol+100));
% No.6: mrhs randomly generated
%       eigenvector as initial X
%     expId = 6;
%     numCol = 10;
%     RHS = rand (rows,numCol);
% %     X   = zEigenvector (:,1:numCol);
%     X   = zSmEigenvector (:,1:numCol);

%%
    [res,histR] = bcg_1( A, RHS, X, maxIters, tol );
    %% output data
    global outputDir ;
    outputfilename= strcat(outputDir, 'bcg_no',int2str(expId),'_b', int2str(numCol),'.csv');
    csvwrite(outputfilename, histR);
end
%%

function exp_old ()
%%
solverName = 'bcbcg';
solverPath = strcat ('..',sepSym, solverName);
cd(solverPath);
%%
rhsPath_root=matrixPath_root;
if rhsDistType == 0
    rhsPath_foldername = strcat(matrixName,sepSym, 'uniform', sepSym);
elseif rhsDistType == 1
    rhsPath_foldername = strcat(matrixName,sepSym, 'normal' , sepSym);
end
% rhsPath_foldername='mesh2e1\uniform\';
rhs_prefixName = strcat (matrixName, '_');
% rhs_prefixName = 'mesh2e1_';
rhs_prefix = strcat (rhsPath_root, rhsPath_foldername, rhs_prefixName);
rhs_suffix = '.csv';
%%
for blocksize = 1:1
    
    rhs_name = strcat(rhs_prefix ,int2str(blocksize) ,rhs_suffix);
    RHS = csvread(rhs_name);
    for s_k =1:4
        X = ones(rows,blocksize);
%         [X_hist, hist] = bcbcg_4(A, RHS, s_k, blocksize, X, eigenValue_max, eigenValue_min,maxIters, tol);
%         [X_hist, hist] = bcbcg_4_qr(A, RHS, s_k, blocksize, X, eigenValue_max, eigenValue_min,maxIters, tol);
        [X_hist, hist] = bcbcg_chapman_saad_1_qr(A, RHS, s_k, blocksize, X, eigenValue_max, eigenValue_min,maxIters, tol);
        
        outputfilename= strcat(outputDir, rhs_prefixName, 'bcbcg_b',int2str(blocksize) ...
            , 's',int2str(s_k),'_expId_', int2str(expId),'.csv');
        csvwrite(outputfilename, hist);
        
        %         plot (hist(:,1), log10(hist(:,2)))
        clear X;
    end
    clear RHS;
end
%%

end