#Date : 12-Nov-2013
#################

############################################################################################
### To use PlotConvergenceHistoryWithXY_SingleMatrixMultipleSolver,
### please form a dataframe first, the column names are solver types, the 1st column name is X
### 1st column save x-axis info, from 2nd to ncol(dataframe) are y data corresponding to each solvers
main_rank<-function()
{
  rm(list=ls());
#   source("/home/sc2012/SvnSakura/SparseLinAlgScilab/DataAnalysisScripts/PlotConvergenceHistory.R")
#   setwd("/home/sc2012/temp/ResultDataTempDir")
  source("/home/scl/SVN_SAKURA/SparseLinAlgScilab/DataAnalysisScripts/PlotConvergenceHistory.R")
  setwd("/home/scl/temp/ResultDataTempDir")
  
#   matrixName <- "494_bus";
#   maxIter=2500;
  ##############################
  #   matrixName <- "bcsstk05";
  #   maxIter=160;
  #############################
#     matrixName <- "bcsstk22";
#     maxIter=600;
  #############################
#   matrixName <- "bcsstm07";
#   maxIter=80;
  #############################
    matrixName <- "mesh2e1"
    maxIter=150
  #############################
  lineLowerBound = 0.1;

  
 
  ##############################
#   solver_prefix<-c("bcg_rankInfo_m2_","bcg_rankInfo_m4_","bcg_rankInfo_m6_"
#                    ,"bcg_rankInfo_m8_","bcg_rankInfo_m10_","bcg_rankInfo_m12_")
#   LineName<-c("x", "bcg_rankInfo_m2_","bcg_rankInfo_m4_","bcg_rankInfo_m6_"
#               ,"bcg_rankInfo_m8_","bcg_rankInfo_m10_","bcg_rankInfo_m12_")
  ##############################
#   solver_prefix<-c( "bcg_rankInfo_m4_","bcg_rankInfo_m6_"
#                     ,"bcg_rankInfo_m8_","bcg_rankInfo_m10_","bcg_rankInfo_m12_")
#   LineName<-c("x"  ,"bcg_rankInfo_m4_","bcg_rankInfo_m6_"
#               ,"bcg_rankInfo_m8_","bcg_rankInfo_m10_","bcg_rankInfo_m12_")
  ##############################bcsstk05
#   solver_prefix<-c( "bcg_rankInfo_m2_", "bcg_rankInfo_m4_", "bcg_rankInfo_m6_", "bcg_rankInfo_m8_")
#   LineName<-c("x"  ,"bcg_rankInfo_m2_", "bcg_rankInfo_m4_", "bcg_rankInfo_m6_", "bcg_rankInfo_m8_")
  ##############################494_bus
#   solver_prefix<-c( "bcg_rankInfo_m2_", "bcg_rankInfo_m4_", "bcg_rankInfo_m8_", "bcg_rankInfo_m16_")
#   LineName<-c("x"  ,"bcg_rankInfo_m2_", "bcg_rankInfo_m4_", "bcg_rankInfo_m8_", "bcg_rankInfo_m16_")
  ##############################bcsstk22
#   solver_prefix<-c( "bcg_rankInfo_m2_", "bcg_rankInfo_m4_", "bcg_rankInfo_m6_", "bcg_rankInfo_m7_")
#   LineName<-c("x"  ,"bcg_rankInfo_m2_", "bcg_rankInfo_m4_", "bcg_rankInfo_m6_", "bcg_rankInfo_m7_")
  ##############################bcsstm07
#   solver_prefix<-c( "bcg_rankInfo_m4_", "bcg_rankInfo_m8_", "bcg_rankInfo_m16_", "bcg_rankInfo_m20_")
#   LineName<-c("x"  ,"bcg_rankInfo_m4_", "bcg_rankInfo_m8_", "bcg_rankInfo_m16_", "bcg_rankInfo_m20_")
  ##############################mesh2e1
  solver_prefix<-c( "bcg_rankInfo_m4_", "bcg_rankInfo_m6_", "bcg_rankInfo_m10_", "bcg_rankInfo_m14_")
  LineName<-c("x"  ,"bcg_rankInfo_m4_", "bcg_rankInfo_m6_", "bcg_rankInfo_m10_", "bcg_rankInfo_m14_")
  ##############################
  # solver_prefix<-c("bcbcg_m1k12_","bcbcg_m1k14_","bcbcg_m1k18_","bcbcg_m1k20_","bcbcg_m2k18_","bcbcg_m4k20_")
  # LineName<-c("x", "bcbcg_m1k12_","bcbcg_m1k14_","bcbcg_m1k18_","bcbcg_m1k20_","bcbcg_m2k18_","bcbcg_m4k20_")
  ##############################
  dataToPlot<-data.frame(c(1:maxIter));
  
  for (prefix_id in 1:length(solver_prefix)) {
    #for (prefix_id in 1:1) {
    file_to_read<-sprintf("%s%s.mtx.csv",solver_prefix[prefix_id],matrixName)
    MatrixTemp <-read.csv(file_to_read,sep=" ",header=F)
    Temp<-MatrixTemp[,3]; #column 2R or 3P
    length(Temp)<-maxIter;
    dataToPlot<-cbind(dataToPlot, Temp)
  }
  dataToPlot[is.na(dataToPlot)]<-lineLowerBound;
  colnames(dataToPlot)<-LineName;
  PlotConvergenceHistoryWithXY_SingleMatrixMultipleSolver_plain(dataToPlot, x_axis_gap=2, tol=tolerence 
                                                        ,figTitle=matrixName, linelowerest = lineLowerBound, cexVal=1, y_axis_label="rank"
                                                        , legendPos="bottomright",range_factor=1.4)
}
############################################################################################
main_residual<-function()
{
  rm(list=ls());
#   source("/home/sc2012/SvnSakura/SparseLinAlgScilab/DataAnalysisScripts/PlotConvergenceHistory.R")
#   setwd("/home/sc2012/temp/ResultDataTempDir")
  source("/home/scl/SVN_SAKURA/SparseLinAlgScilab/DataAnalysisScripts/PlotConvergenceHistory.R")
  setwd("/home/scl/temp/ResultDataTempDir")
  
#######################################  
#   matrixName <- "494_bus";
#   tolerence = 7.89519e+04 * 1e-16;
#   maxIter=2500;
  #######################################
#   matrixName <- "bcsstk05";
#   tolerence = 4.25647e+03 * 1e-16;
#   maxIter=160;
  #######################################
#   matrixName <- "bcsstm07";
#   tolerence = 2.73243e+01 * 1e-16;
#   maxIter=80;
  #######################################
  matrixName <- "mesh2e1";
  tolerence = 1.20968e+02 * 1e-16; 
  maxIter=150;
  #######################################
#     matrixName <- "bcsstk22";
#     tolerence = 3.72373e+03 * 1e-16;
#     maxIter=600;
  #######################################
  lineLowerBound = tolerence * 0.5;
  
  ##############################
#   solver_prefix<-c("cg_regular_","bcg_m2_","bcg_m4_","bcg_m6_","bcg_m8_","bcg_m10_","bcg_m12_")
#   LineName<-c("x","cg"          ,"bcg_m2_","bcg_m4_","bcg_m6_","bcg_m8_","bcg_m10_","bcg_m12_")
  ##############################
#     solver_prefix<-c("cg_regular_","bcg_m2_","bcg_m4_","bcg_m6_","bcg_m8_")
#     LineName<-c("x","cg"          ,"bcg_m2_","bcg_m4_","bcg_m6_","bcg_m8_")
  ##############################494_bus
#   solver_prefix<-c("bcg_m2_","bcg_m4_","bcg_m8_","bcg_m16_")
#   LineName<-c("x", "bcg_m2_","bcg_m4_","bcg_m8_","bcg_m16_")
  ##############################bcsstk22
#   solver_prefix<-c("bcg_m2_","bcg_m4_","bcg_m6_","bcg_m7_")
#   LineName<-c("x", "bcg_m2_","bcg_m4_","bcg_m6_","bcg_m7_")
  ##############################bcsstm07
#   solver_prefix<-c("bcg_m4_","bcg_m8_","bcg_m16_","bcg_m20_")
#   LineName<-c("x", "bcg_m4_","bcg_m8_","bcg_m16_","bcg_m20_")
  ##############################mesh2e1
  solver_prefix<-c("bcg_m4_","bcg_m6_","bcg_m10_","bcg_m14_")
  LineName<-c("x", "bcg_m4_","bcg_m6_","bcg_m10_","bcg_m14_")
  ##############################
#   solver_prefix<-c("bcg_m4_","bcg_m6_","bcg_m8_")
#   LineName<-c("x", "bcg_m4_","bcg_m6_","bcg_m8_")
  ##############################
#     solver_prefix<-c("cg_regular_","bcg_m2_","bcg_m4_","bcg_m6_","bcg_m8_","bcg_m10_","bcg_m12_","bcg_m20_")
#     LineName<-c("x","cg"          ,"bcg_m2_","bcg_m4_","bcg_m6_","bcg_m8_","bcg_m10_","bcg_m12_","bcg_m20_") 
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
  
  dataToPlot[is.na(dataToPlot)]<-lineLowerBound;
  colnames(dataToPlot)<-LineName;
  PlotConvergenceHistoryWithXY_SingleMatrixMultipleSolver(dataToPlot, x_axis_gap=2, tol=tolerence, 
                                                         ,figTitle=matrixName, linelowerest = lineLowerBound
                                                         , cexVal=1, legendPos="bottomright",range_factor=1.4)
}
############################################################################################
main_cond<-function()
{
  rm(list=ls());
#   source("/home/sc2012/SvnSakura/SparseLinAlgScilab/DataAnalysisScripts/PlotConvergenceHistory.R")
#   setwd("/home/sc2012/temp/ResultDataTempDir")
  source("/home/scl/SVN_SAKURA/SparseLinAlgScilab/DataAnalysisScripts/PlotConvergenceHistory.R")
  setwd("/home/scl/temp/ResultDataTempDir")
  
  
#     matrixName <- "494_bus";
#     maxIter=2500;
##################################
#   matrixName <- "bcsstk05";
#   maxIter=160;
##################################
#   matrixName <- "bcsstk22";
#   maxIter=600;
##################################
  matrixName <- "bcsstm07";
  maxIter=80;
# ##################################
#   matrixName <- "mesh2e1";
#   maxIter=150;
##################################
  lineLowerBound = 1.0;

 
  
  ##############################
#   solver_prefix<-c("bcg_condInfo_m4_","bcg_condInfo_m6_","bcg_condInfo_m8_","bcg_condInfo_m10_","bcg_condInfo_m12_")
#   LineName<-c("x", "bcg_condInfo_m4_","bcg_condInfo_m6_","bcg_condInfo_m8_","bcg_condInfo_m10_","bcg_condInfo_m12_")
  ##############################
#   solver_prefix<-c("bcg_condInfo_m4_","bcg_condInfo_m6_","bcg_condInfo_m8_")
#   LineName<-c("x", "bcg_condInfo_m4_","bcg_condInfo_m6_","bcg_condInfo_m8_")
  ##############################
#   solver_prefix<-c("bcg_condInfo_m2_","bcg_condInfo_m4_","bcg_condInfo_m6_","bcg_condInfo_m8_")
#   LineName<-c("x", "bcg_condInfo_m2_","bcg_condInfo_m4_","bcg_condInfo_m6_","bcg_condInfo_m8_")
  ##############################
#   solver_prefix<-c("bcg_condInfo_m2_","bcg_condInfo_m4_","bcg_condInfo_m8_","bcg_condInfo_m16_")
#   LineName<-c("x", "bcg_condInfo_m2_","bcg_condInfo_m4_","bcg_condInfo_m8_","bcg_condInfo_m16_")
  ##############################bcsstk22
  #   solver_prefix<-c("bcg_condInfo_m2_","bcg_condInfo_m4_","bcg_condInfo_m6_","bcg_condInfo_m7_")
  #   LineName<-c("x", "bcg_condInfo_m2_","bcg_condInfo_m4_","bcg_condInfo_m6_","bcg_condInfo_m7_")
  #############################bcsstm07
    solver_prefix<-c("bcg_condInfo_m4_","bcg_condInfo_m8_","bcg_condInfo_m16_","bcg_condInfo_m20_")
    LineName<-c("x", "bcg_condInfo_m4_","bcg_condInfo_m8_","bcg_condInfo_m16_","bcg_condInfo_m20_")
  ##############################mesh2e1
#   solver_prefix<-c( "bcg_condInfo_m4_", "bcg_condInfo_m6_", "bcg_condInfo_m10_", "bcg_condInfo_m14_")
#   LineName<-c("x"  ,"bcg_condInfo_m4_", "bcg_condInfo_m6_", "bcg_condInfo_m10_", "bcg_condInfo_m14_")
  ##############################
#   solver_prefix<-c("bcg_condInfo_m2_","bcg_condInfo_m4_","bcg_condInfo_m6_","bcg_condInfo_m8_"
#                    ,"bcg_condInfo_m10_","bcg_condInfo_m12_","bcg_condInfo_m20_")
#   LineName<-c("x" ,"bcg_condInfo_m2_","bcg_condInfo_m4_","bcg_condInfo_m6_","bcg_condInfo_m8_"
#               ,"bcg_condInfo_m10_","bcg_condInfo_m12_","bcg_condInfo_m20_")
  ##############################
#   solver_prefix<-c("bcg_condInfo_m28_")
#   LineName<-c("x" ,"bcg_condInfo_m28_")
  ##############################
  dataToPlot<-data.frame(c(1:maxIter));
  
  for (prefix_id in 1:length(solver_prefix)) {
    #for (prefix_id in 1:1) {
    file_to_read<-sprintf("%s%s.mtx.csv",solver_prefix[prefix_id],matrixName)
    MatrixTemp <-read.csv(file_to_read,sep=" ",header=F)
    Temp<-MatrixTemp[,2]; #2R,3P
    length(Temp)<-maxIter;
    dataToPlot<-cbind(dataToPlot, Temp)
  }
  
  dataToPlot[is.na(dataToPlot)]<-lineLowerBound;
  colnames(dataToPlot)<-LineName;
  PlotConvergenceHistoryWithXY_SingleMatrixMultipleSolver(dataToPlot, x_axis_gap=2, tol=tolerence, 
                                                          ,figTitle=matrixName, linelowerest = lineLowerBound, y_axis_label="log(cond)"
                                                          , cexVal=1, legendPos="bottomright",range_factor=1.4)
}
###########################################################################################
# main_residual()
# main_rank()
main_cond()
############################################################################################
