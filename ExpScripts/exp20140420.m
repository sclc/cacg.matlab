function exp20140420(machineId, matrixName, rhsDistType,eigenMax, eigenMin, expId)
% main function for experiment on 2014-03-29
% local machine id = 0
% at52  machine id = 1
% matrixName: string
% rhsDistType: string
%%
if machineId == 0
    sepSym = '\';
elseif machineId == 1
    sepSym = '/';
end
%%
if machineId == 0
    matrixPath_root='Y:\';
elseif machineId == 1
    matrixPath_root='/home/scl/MStore/';
end

%%
matrixPath_foldername=strcat(matrixName,sepSym);
%
matrixPath_filename=strcat( matrixName , '.mtx');
%
eigenValue_max = eigenMax;
eigenValue_min = eigenMin;

%%
matrixPath = strcat (matrixPath_root, matrixPath_foldername, matrixPath_filename);
solverName = 'bcbcg';
solverPath = strcat ('..',sepSym, solverName);
cd(solverPath);
[A,rows,cols,entries,rep,field,symm] = mmread(matrixPath);

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
maxIters = 50;
tol = 1e-4;
%%
if machineId == 0
    outputDir = 'X:\ExperimentalDataTemp\';
elseif machineId ==1
    outputDir = '/home/scl/caExpStr';
end
%%
for blocksize = 1:2
    
    rhs_name = strcat(rhs_prefix ,int2str(blocksize) ,rhs_suffix);
    RHS = csvread(rhs_name);
    for s_k =1:4
        X = ones(rows,blocksize);
        [X_hist, hist] = bcbcg_4(A, RHS, s_k, blocksize, X, eigenValue_max, eigenValue_min,maxIters, tol);
        
        outputfilename= strcat(outputDir, rhs_prefixName, 'bcbcg_b',int2str(blocksize) ...
            , 's',int2str(s_k),'_expId_', int2str(expId),'.csv');
        csvwrite(outputfilename, hist);
        
        %         plot (hist(:,1), log10(hist(:,2)))
        clear X;
    end
    clear RHS;
end

expFolder = strcat('..',sepSym, 'ExpScripts');
cd(expFolder)
end
