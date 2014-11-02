#Date : 24-Oct-2013
#################
############################################################################################
### To use PlotConvergenceHistoryWithXY_SingleMatrixMultipleSolver,
### please form a dataframe first, the column names are solver types, the 1st column name is X
### 1st column save x-axis info, from 2nd to ncol(dataframe) are y data corresponding to each solvers
main<-function()
{
  rm(list=ls());
  source("/home/sc2012/SvnSakura/SparseLinAlgScilab/DataAnalysisScripts/PlotConvergenceHistory.R")
  setwd("/home/sc2012/SvnSakura/SparseLinAlgScilab/cg/ResultDataTempDir")

  matrixName <- "bcsstm07";
  tolerence = 2.73243e+01 * 1e-16;
  lineLowerBound = tolerence * 0.5;
  maxIter=100;

  solver_prefix<-c("cg_regular_", "bcg_m30_", "bcbcg_m6k5_","bcbcg_m5k6_","bcbcg_m3k10_")
  LineName<-c("x","cg",           "bcg_m30", "bcbcg_m6k5","bcbcg_m5k6","bcbcg_m3k10")
  ##############################
  # solver_prefix<-c("cg_regular_","bcbcg_m2k8_","bcbcg_m2k10_")
  # LineName<-c("x","cg","bcbcg_m2k8","bcbcg_m2k10");
  ##############################
  # solver_prefix<-c("cg_regular_","bcbcg_m1k2_","bcbcg_m1k4_","bcbcg_m1k8_","bcbcg_m1k10_"
  #                               ,"bcbcg_m1k12_","bcbcg_m1k14_","bcbcg_m1k18_","bcbcg_m1k20_")
  # LineName<-c("x","cg_regular","bcbcg_m1k2_","bcbcg_m1k4_","bcbcg_m1k8_","bcbcg_m1k10_"
  #                             ,"bcbcg_m1k12_","bcbcg_m1k14_","bcbcg_m1k18_","bcbcg_m1k20_")
  ##############################
  # solver_prefix<-c("bcbcg_m1k12_","bcbcg_m1k14_","bcbcg_m1k18_","bcbcg_m1k20_","bcbcg_m2k18_","bcbcg_m4k20_")
  # LineName<-c("x", "bcbcg_m1k12_","bcbcg_m1k14_","bcbcg_m1k18_","bcbcg_m1k20_","bcbcg_m2k18_","bcbcg_m4k20_")
  ##############################
  # solver_prefix<-c("bcbcg_m1k18_","bcbcg_m1k20_","bcbcg_m4k18_","bcbcg_m4k20_")
  # LineName<-c("x", "bcbcg_m1k18_","bcbcg_m1k20_","bcbcg_m4k18_","bcbcg_m4k20_")
  ##############################
#   solver_prefix<-c("bcbcg_m1k16_","bcbcg_m1k18_","bcbcg_m1k20_","bcbcg_m1k10_","bcbcg_m4k10_","bcbcg_m8k10_","bcbcg_m10k10_")
#   LineName<-c("x", "bcbcg_m1k16","bcbcg_m1k18","bcbcg_m1k20","bcbcg_m1k10","bcbcg_m4k10","bcbcg_m8k10","bcbcg_m10k10")
  ##############################
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
  PlotConvergenceHistoryWithXY_SingleMatrixMultipleSolver(dataToPlot, x_axis_gap=1, tol=tolerence, 
                                                          figTitle=matrixName, linelowerest = lineLowerBound)
}
############################################################################################
main()
############################################################################################
