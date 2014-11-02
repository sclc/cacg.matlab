#Date : 28-Oct-2013
#################
############################################################################################
### To use PlotConvergenceHistoryWithXY_SingleMatrixMultipleSolver,
### please form a dataframe first, the column names are solver types, the 1st column name is X
### 1st column save x-axis info, from 2nd to ncol(dataframe) are y data corresponding to each solvers
main<-function()
{
  rm(list=ls());
  source("/home/sc2012/SvnSakura/SparseLinAlgScilab/DataAnalysisScripts/PlotConvergenceHistory.R")
  setwd("/home/sc2012/temp/ResultDataTempDir")

  matrixName <- "494_bus";
  tolerence = 2.73243e+01 * 1e-16;
  lineLowerBound = tolerence * 0.5;
  maxIter=2500;

#   solver_prefix<-c("cg_regular_", "bcg_m20_", "bcbcg_m5k4_","bcbcg_m4k5_","bcg_m4_")
#   LineName<-c("x","cg",           "bcg_m20", "bcbcg_m5k4","bcbcg_m4k5","bcg_m4")")
  ##############################
  solver_prefix<-c("cg_regular_","bcg_m2_","bcg_m4_","bcg_m6_","bcg_m8_","bcg_m10_","bcg_m12_")
  LineName<-c("x","cg"          ,"bcg_m2_","bcg_m4_","bcg_m6_","bcg_m8_","bcg_m10_","bcg_m12_")
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
                                                          figTitle=matrixName, linelowerest = lineLowerBound, cexVal=0.8, legendPos="bottomright")
}
############################################################################################
main()
############################################################################################
