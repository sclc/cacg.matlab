#Date : 18-Mar-2016
#################

############################################################################################
### To use PlotConvergenceHistoryWithXY_SingleMatrixMultipleSolver,
### please form a dataframe first, the column names are solver types, the 1st column name is X
### 1st column save x-axis info, from 2nd to ncol(dataframe) are y data corresponding to each solvers
rm(list = ls())
############################################################################################
main_residual<-function()
{
  rm(list=ls());
  source("/Users/sclc/Projects/cacg.matlab.git/RDataAnalysisScripts/PlotConvergenceHistory.R")
  source("/Users/sclc/Projects/cacg.matlab.git/RDataAnalysisScripts/PlotCovergenceHistoryWithXY_SingleMatrixMultipleSolver_region.R")
  setwd("/Users/sclc/datatemp")

#######################################  
#   matrixName <- "494_bus";
#   tolerence = 7.89519e+04 * 1e-16;
#   maxIter=2500;
  #######################################
#   matrixName <- "bcsstk05";
#   tolerence = 4.25647e+03 * 1e-16;
#   maxIter=160;
  #######################################
#   matrixName <- "mesh2e1";
#   tolerence = 1.20968e+02 * 1e-16; 
#   maxIter=380;
  #######################################
#     matrixName <- "bcsstk22";
#     tolerence = 3.72373e+03 * 1e-16;
#     maxIter=600;
  #######################################
#   matrixName <- "nasa4704";
#   tolerence = 1e-10
#   maxIter=4000;
  #######################################

 # matrixName <- "ex13";
  # matrixName <- "nasa2910";
  
  # matrixName <- "crystm01";
  # tolerence = 1e-13
  # matrixName <- "nasa2146";
  # tolerence = 1e-13
  matrixName <- "Chem97ZtZ";
  tolerence = 1e-13
  maxIter=1000;
  #######################################
  lineLowerBound = tolerence * 1;
  
  ##############################
  # solver_prefix<-c("bcbcg_4_no1_s6_b1", "bcbcg_4_no2_s6_b1","bcbcg_4_no3_s6_b1"
  #                   )
  # LineName<-c("x", "eigs", "gerschgorin", "power iteration"
  #                   )
  

  
  ########################
  solver_prefix<-c("bcg_1_no1_m1", "bcg_1_no1_m12",
                   "bcbcg_4_no1_s2_m1", "bcbcg_4_no1_s6_m1", 
                   "bcbcg_4_no1_s2_m6", "bcbcg_4_no1_s6_m6")
  LineName<-c(     "x", "cg", "bcg_m12", 
                   "bcbcg_m1s2","bcbcg_m1s6",
                   "bcbcg_m6s2", "bcbcg_m6s6")
  
  
  ##############################
  ##############################

  dataToPlot<-data.frame(c(1:maxIter));
  
  for (prefix_id in 1:length(solver_prefix)) {
    #for (prefix_id in 1:1) {
    file_to_read<-sprintf("%s_%s.csv",matrixName, solver_prefix[prefix_id])
    MatrixTemp <-read.csv(file_to_read,sep=",",header=F)
    Temp<-MatrixTemp[,2]; 
    length(Temp)<-maxIter;
    dataToPlot<-cbind(dataToPlot, Temp)
  }
  
  dataToPlot[is.na(dataToPlot)]<-lineLowerBound;
  colnames(dataToPlot)<-LineName;
  PlotConvergenceHistoryWithXY_SingleMatrixMultipleSolver_region(dataToPlot, tol=tolerence
                                                         , x_axis_gap=2
                                                         #, y_axis_gap=0.0001
                                                         #, y_axis_label='||r1||/||b1|| or ratio'
                                                         ,figTitle=matrixName, linelowerest = lineLowerBound
                                                         , cexVal=1.5, legendPos="topright",range_factor=1.2
                                                         , startP=0, endP=200, titleSize=1.5
                                                         )
}

###########################################################################################

main_residual()

############################################################################################


