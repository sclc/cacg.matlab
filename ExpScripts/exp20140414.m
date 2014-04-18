function exp20140414()
% main function for experiment on 2014-03-29

%%
matrixPath_root='Y:\';
%%
matrixPath_foldername='mesh2e1\';
matrixPath_filename='mesh2e1.mtx';
eigenValue_max = 491.700506380000;
% % eigenValue_max = 492.700506380000;
% eigenValue_max = 491.700506380000 * 2.0;
eigenValue_min = 1.00000000000000;
%%
% matrixPath_foldername='1001to2000\';
% matrixPath_filename='bcsstk27.mtx';
% % eigenValue_max = 4307014.91811036;
% % eigenValue_max = 4307015.91811036;
% eigenValue_max = 4307014.91811036 * 2.0;
% eigenValue_min = -1610287.04470819;
%%
% matrixPath_foldername='';
% matrixPath_filename='consph.mtx';
% matrixPath_foldername='5001to10000\';
% eigenValue_max = 0;
% eigenValue_min = 0;
%%
% matrixPath_filename='nd3k.mtx';
% matrixPath_foldername='5001to8000\';
% matrixPath_filename='s1rmq4m1.mtx';
%%
% matrixPath_foldername='4001to5000\';
% matrixPath_filename='nasa4704.mtx';
% eigenValue_max = 338172337.923466;
% eigenValue_min = -102210985.590486;
%%
matrixPath = strcat (matrixPath_root, matrixPath_foldername, matrixPath_filename);

[A,rows,cols,entries,rep,field,symm] = mmread(matrixPath);

%%
rhsPath_root='Y:\';

rhsPath_foldername='mesh2e1\';
% rhsPath_foldername='RHSUniformDist\';

rhs_prefixName = 'mesh2e1_';
% rhs_prefixName = 'bcsstk27_';
% rhs_prefixName = 'consph_';
% rhs_prefixName = 'nd3k_';
% rhs_prefixName = 's1rmq4m1_';
% rhs_prefixName = 'nasa4704_';

rhs_prefix = strcat (rhsPath_root, rhsPath_foldername, rhs_prefixName);

rhs_suffix = '.csv';
%%
maxIters = 200;
tol = 1e-4;
%%
outputDir = 'X:\ExperimentalDataTemp\'
%%
for blocksize = 1:2
    
    rhs_name = strcat(rhs_prefix ,int2str(blocksize) ,rhs_suffix);
    RHS = csvread(rhs_name);
    for s_k =1:4
        X = ones(rows,blocksize);
        [X_hist, hist] = bcbcg_3(A, RHS, s_k, blocksize, X, eigenValue_max, eigenValue_min,maxIters, tol);
        
        outputfilename= strcat(outputDir, rhs_prefixName, 'bcbcg_b',int2str(blocksize) ...
            , 's',int2str(s_k),'.csv');
        csvwrite(outputfilename, hist);
        
        plot (hist(:,1), log10(hist(:,2)))
        clear X;
    end
    clear RHS;
end

end
