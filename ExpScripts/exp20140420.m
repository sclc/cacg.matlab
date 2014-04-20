function exp20140420(machineId, matrixName, rhsDistType,eigenMax, eigenMin)
% main function for experiment on 2014-03-29
% local machine id = 0
% at52  machine id = 1
% matrixName: string
% rhsDistType: string
%%
if machineId == 0
    matrixPath_root='Y:\';
elseif machineId == 1
    matrixPath_root='/home/scl/MStore/';
end

% %%
if machineId == 0
matrixPath_foldername=strcat(matrixName,'\');
elseif machineId == 1
    matrixPath_foldername=strcat(matrixName,'/');
end
matrixPath_filename=strcat( matrixName , '.mtx');
eigenValue_max = eigenMax;
eigenValue_min = eigenMin;

%%
matrixPath = strcat (matrixPath_root, matrixPath_foldername, matrixPath_filename);

[A,rows,cols,entries,rep,field,symm] = mmread(matrixPath);

%%
rhsPath_root='Y:\';
rhsPath_root='/home/scl/MStore';
%%
rhsPath_foldername='mesh2e1\uniform\';
%%
% rhsPath_foldername='mesh2e1\normal\';
% rhsPath_foldername='nasa4704\uniform\';
% rhsPath_foldername='nasa4704\normal\';
% rhsPath_foldername='bcsstk27\uniform\';
% rhsPath_foldername='bcsstk27\normal\';
% rhsPath_foldername='consph\uniform\';
% rhsPath_foldername='consph\normal\';

rhs_prefixName = 'mesh2e1_';
% rhs_prefixName = 'bcsstk27_';
% rhs_prefixName = 'consph_';
% rhs_prefixName = 'nasa4704_';

rhs_prefix = strcat (rhsPath_root, rhsPath_foldername, rhs_prefixName);

rhs_suffix = '.csv';
%%
maxIters = 200;
tol = 1e-4;
%%
outputDir = 'X:\ExperimentalDataTemp\';
%%
for blocksize = 1:2
    
    rhs_name = strcat(rhs_prefix ,int2str(blocksize) ,rhs_suffix);
    RHS = csvread(rhs_name);
    for s_k =1:4
        X = ones(rows,blocksize);
        [X_hist, hist] = bcbcg_4(A, RHS, s_k, blocksize, X, eigenValue_max, eigenValue_min,maxIters, tol);
        
        outputfilename= strcat(outputDir, rhs_prefixName, 'bcbcg_b',int2str(blocksize) ...
            , 's',int2str(s_k),'.csv');
        csvwrite(outputfilename, hist);
        
        %         plot (hist(:,1), log10(hist(:,2)))
        clear X;
    end
    clear RHS;
end

end
