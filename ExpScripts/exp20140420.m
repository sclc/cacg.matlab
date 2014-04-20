function exp20140420()
% main function for experiment on 2014-03-29

%%
matrixPath_root='Y:\';
matrixPath_root='/home/scl/MStore';
% %%
matrixPath_foldername='mesh2e1\';
matrixPath_filename='mesh2e1.mtx';
eigenValue_max = 381.3006;
eigenValue_min = 1.3132;
% eigenValue_max = 491.70050638;
% eigenValue_min = 1;
%%
% matrixPath_foldername='bcsstk27\';
% matrixPath_filename='bcsstk27.mtx';
% eigenValue_max = 3465100;
% eigenValue_min = 143.5646;
% eigenValue_max = 4307014.91811036;
% eigenValue_min = -1610287.04470819;
%%
% matrixPath_foldername='nasa4704\';
% matrixPath_filename='nasa4704.mtx';
% eigenValue_max = 206690000;
% eigenValue_min = 4.9613;
% eigenValue_max = 338172337.923466;
% eigenValue_min = -102210985.590486;
%%
% matrixPath_foldername='consph\';
% matrixPath_filename='consph.mtx';
% eigenValue_max = 72593;
% eigenValue_min = 0.0077;
% % eigenValue_max = 104498.0369333;
% % eigenValue_min = -72325.6449084;
%%
matrixPath = strcat (matrixPath_root, matrixPath_foldername, matrixPath_filename);

[A,rows,cols,entries,rep,field,symm] = mmread(matrixPath);

%%
rhsPath_root='Y:\';

rhsPath_foldername='mesh2e1\uniform\';
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
