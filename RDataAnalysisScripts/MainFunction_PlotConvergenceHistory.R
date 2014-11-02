source("/home/scl/SVN_SAKURA/SparseLinAlgScilab/DataAnalysisScripts/PlotConvergenceHistory.R")

############################################################################################
setwd("/home/scl/SVN_SAKURA/SparseLinAlgScilab/cg/ResultDataTempDir")
csvlist<-dir();
i=12;
fileToPlot<-csvlist[i]
print(fileToPlot)
label=strsplit(fileToPlot,".mtx.csv")
tempcsv<-read.csv(fileToPlot, sep=" ", header=F)

x_id =1;
y_id =2;
PlotConvergenceHistoryWithXY_SingleLine(tempcsv[,x_id],tempcsv[,y_id], lineNames=label)
############################################################################################
############################################################################################
### To use PlotConvergenceHistoryWithXY_SingleMatrixMultipleSolver,
### please form a dataframe first, the column names are solver types, the 1st column name is X
### 1st column save x-axis info, from 2nd to ncol(dataframe) are y data corresponding to each solvers
source("/home/scl/SVN_SAKURA/SparseLinAlgScilab/DataAnalysisScripts/PlotConvergenceHistory.R")
setwd("/home/scl/SVN_SAKURA/SparseLinAlgScilab/cg/ResultDataTempDir")

matrixName <- "bcsstm07";
tolerence = 2.73243e+01 * 1e-16;
lineLowerBound = tolerence * 0.01;
maxIter=100;

solver_prefix<-c("cg_regular_","bcg_m4_","cbcg_k4_","bcbcg_m2k2_")
LineName<-c("x","cg","bcg_m4","cbcg_k4","bcbcg_m2k2")

dataToPlot<-data.frame(c(1:maxIter));

for (prefix_id in 1:length(solver_prefix)) {
  #for (prefix_id in 1:1) {
  file_to_read<-sprintf("%s%s.mtx.csv",solver_prefix[prefix_id],matrixName)
  MatrixTemp <-read.csv(file_to_read,sep=" ",header=F)
  Temp<-MatrixTemp[,2];
  length(Temp)<-maxIter;
  dataToPlot<-cbind(dataToPlot, Temp)
}

colnames(dataToPlot)<-LineName;
PlotConvergenceHistoryWithXY_SingleMatrixMultipleSolver(dataToPlot, x_axis_gap=2, tol=tolerence, 
                                                        figTitle=matrixName, linelowerest = lineLowerBound)

############################################################################################
############################################################################################
