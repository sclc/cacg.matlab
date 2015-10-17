#Date : 24-APR-2015
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
  source("/Users/sclc/Projects/CAKSMsMatlabProj.git/RDataAnalysisScripts/PlotConvergenceHistory.R")
  source("/Users/sclc/Projects/CAKSMsMatlabProj.git/RDataAnalysisScripts/PlotCovergenceHistoryWithXY_SingleMatrixMultipleSolver_region.R")
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
  matrixName <- "bcsstm07";
  tolerence = 1e-15
  maxIter=500;
  #######################################
  lineLowerBound = tolerence * 1;
  
  ##############################mesh2e1
#   solver_prefix<-c("cg_alpha_test_1_alpharatio_no1","cg_alpha_test_1_alpharatio_no2"
#                    , "cg_alpha_test_1_residual_no1", "cg_alpha_test_1_residual_no2")
#   LineName<-c("x", "cg_alpha_test_1_alpharatio_no1","cg_alpha_test_1_alpharatio_no2"
#                    , "cg_alpha_test_1_residual_no1", "cg_alpha_test_1_residual_no2")

  ##############################
  solver_prefix<-c("cg_alpha_test_1_alpharatio_no1","cg_alpha_test_1_alpharatio_no2"
                    #, "cg_alpha_test_1_alpharatio_no3"
                    )
  LineName<-c("x", "cg_alpha_test_1_alpharatio_no1","cg_alpha_test_1_alpharatio_no2"
                    #, "cg_alpha_test_1_alpharatio_no3"
                    )

  ##############################
#   solver_prefix<-c("cg_alpha_test_1_residual_no1", "cg_alpha_test_1_residual_no2"
#                    #,"cg_alpha_test_1_residual_no3"
#                    )
#   LineName<-c("x", "cg_alpha_test_1_residual_no1", "cg_alpha_test_1_residual_no2"
#                   #, "cg_alpha_test_1_residual_no3"
#                   )
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
                                                         , x_axis_gap=1
                                                         #, y_axis_gap=0.0001
                                                         #, y_axis_label='||r1||/||b1|| or ratio'
                                                         ,figTitle=matrixName, linelowerest = lineLowerBound
                                                         , cexVal=1, legendPos="bottomright",range_factor=1.6
                                                         , startP=10, endP=30
                                                         )
}

###########################################################################################

main_residual()

############################################################################################


