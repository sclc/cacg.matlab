#Date : 05-Dec-2014
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
#   maxIter=50;
  #######################################
#     matrixName <- "bcsstk22";
#     tolerence = 3.72373e+03 * 1e-16;
#     maxIter=600;
  #######################################
  matrixName <- "nasa4704";
  tolerence = 1e-10
  maxIter=1000;
  #######################################
#   matrixName <- "bcsstm07";
#   tolerence = 1e-15
#   maxIter=600;
#  maxIter=25;
  #######################################
  lineLowerBound = tolerence * 1;
  
  ##############################494_bus
#   solver_prefix<-c("bcg_m2_","bcg_m4_","bcg_m8_","bcg_m16_")
#   LineName<-c("x", "bcg_m2_","bcg_m4_","bcg_m8_","bcg_m16_")
  ##############################mesh2e1
#   solver_prefix<-c("bcg_1_m4_","bcg_1_m8_","bcg_1_m10_","bcg_qr_m4_","bcg_qr_m8_","bcg_qr_m10_")
#   LineName<-c("x", "bcg_1_m4_","bcg_1_m8_","bcg_1_m10_","bcg_qr_m4_","bcg_qr_m8_","bcg_qr_m10_")
  ##############################bcsstk05
#   solver_prefix<-c("_bcbcg_no4_s1_b1","_bcbcg_no4_s1_b4","_bcbcg_no4_s3_b4",
#                    "_bcbcg_no5_s1_b1","_bcbcg_no5_s1_b4","_bcbcg_no5_s3_b4")
#   LineName<-c("x", "bcbcg_no4_s1_b1","bcbcg_no4_s1_b4","bcbcg_no4_s3_b4",
#                    "bcbcg_no5_s1_b1","bcbcg_no5_s1_b4","bcbcg_no5_s3_b4")
  ##############################
#   solver_prefix<-c("_bcbcg_no4_s1_b1","_bcbcg_no4_s1_b3","_bcbcg_no4_s1_b4",
#                    "_bcbcg_no5_s1_b1","_bcbcg_no5_s1_b3","_bcbcg_no5_s1_b4")
#   LineName<-c("x", "bcbcg_no4_s1_b1","bcbcg_no4_s1_b3","bcbcg_no4_s1_b4",
#                    "bcbcg_no5_s1_b1","bcbcg_no5_s1_b3","bcbcg_no5_s1_b4")
  ##############################
#   solver_prefix<-c("_bcbcg_no4_s2_b1","_bcbcg_no4_s2_b3","_bcbcg_no4_s2_b4",
#                    "_bcbcg_no5_s2_b1","_bcbcg_no5_s2_b3","_bcbcg_no5_s2_b4")
#   LineName<-c("x", "bcbcg_no4_s2_b1","bcbcg_no4_s2_b3","bcbcg_no4_s2_b4",
#                    "bcbcg_no5_s2_b1","bcbcg_no5_s2_b3","bcbcg_no5_s2_b4")

  ##############################
#   solver_prefix<-c("_bcbcg_no4_s3_b1","_bcbcg_no4_s3_b3","_bcbcg_no4_s3_b4",
#                    "_bcbcg_no5_s3_b1","_bcbcg_no5_s3_b3","_bcbcg_no5_s3_b4")
#   LineName<-c("x", "bcbcg_no4_s3_b1","bcbcg_no4_s3_b3","bcbcg_no4_s3_b4",
#                    "bcbcg_no5_s3_b1","bcbcg_no5_s3_b3","bcbcg_no5_s3_b4")
  ##############################
#   solver_prefix<-c("_bcbcg_no4_s1_b1","_bcbcg_no4_s1_b3","_bcbcg_no4_s1_b4",
#                   "_bcbcg_no2_s1_b1","_bcbcg_no2_s1_b3","_bcbcg_no2_s1_b4")
#   LineName<-c("x", "bcbcg_no4_s1_b1","bcbcg_no4_s1_b3","bcbcg_no4_s1_b4",
#                  "bcbcg_no2_s1_b1","bcbcg_no2_s1_b3","bcbcg_no2_s1_b4")
  ##############################
#   solver_prefix<-c("_bcbcg_no5_s1_b1","_bcbcg_no5_s1_b2","_bcbcg_no5_s1_b3","_bcbcg_no5_s1_b4",
#                    "_bcbcg_no6_s1_b1","_bcbcg_no6_s1_b2","_bcbcg_no6_s1_b3","_bcbcg_no6_s1_b4")
#   LineName<-c("x", "bcbcg_no5_s1_b1","bcbcg_no5_s1_b2","bcbcg_no5_s1_b3","bcbcg_no5_s1_b4",
#                    "bcbcg_no6_s1_b1","bcbcg_no6_s1_b2","bcbcg_no6_s1_b3","bcbcg_no6_s1_b4")
  ##############################
#   solver_prefix<-c("_bcbcg_no5_s2_b1","_bcbcg_no5_s2_b2","_bcbcg_no5_s2_b3","_bcbcg_no5_s2_b4",
#                    "_bcbcg_no6_s2_b1","_bcbcg_no6_s2_b2","_bcbcg_no6_s2_b3","_bcbcg_no6_s2_b4")
#   LineName<-c("x", "bcbcg_no5_s2_b1","bcbcg_no5_s2_b2","bcbcg_no5_s2_b3","bcbcg_no5_s2_b4",
#                    "bcbcg_no6_s2_b1","bcbcg_no6_s2_b2","bcbcg_no6_s2_b3","bcbcg_no6_s2_b4")
  ##############################
#   solver_prefix<-c("_bcbcg_no5_s3_b1","_bcbcg_no5_s3_b2","_bcbcg_no5_s3_b3","_bcbcg_no5_s3_b4",
#                    "_bcbcg_no6_s3_b1","_bcbcg_no6_s3_b2","_bcbcg_no6_s3_b3","_bcbcg_no6_s3_b4")
#   LineName<-c("x", "bcbcg_no5_s3_b1","bcbcg_no5_s3_b2","bcbcg_no5_s3_b3","bcbcg_no5_s3_b4",
#               "bcbcg_no6_s3_b1","bcbcg_no6_s3_b2","bcbcg_no6_s3_b3","bcbcg_no6_s3_b4")
  ##############################
#   solver_prefix<-c("_bcbcg_no5_s1_b1","_bcbcg_no5_s2_b1","_bcbcg_no5_s3_b2",
#                    "_bcbcg_no6_s1_b1","_bcbcg_no6_s1_b2","_bcbcg_no6_s2_b3")
#   LineName<-c("x", "bcbcg_no5_s1_b1","bcbcg_no5_s2_b1","bcbcg_no5_s3_b2",
#                    "bcbcg_no6_s1_b1","bcbcg_no6_s1_b2","bcbcg_no6_s2_b3")
  ##############################
#   solver_prefix<-c("_bcbcg_no2_s4_b3","_cacg_monomial_1_no2_s4_b3","_cacg_monomial_2_no2_s4_b3")
#   LineName<-c("x", "bcbcg_no2_s4_b3","cacg_monomial_1_no2_s4_b3","cacg_monomial_2_no2_s4_b3")
  ##############################
#   solver_prefix<-c("_bcbcg_no2_s6_b3","_cacg_monomial_1_no2_s6_b3","_cacg_monomial_2_no2_s6_b3")
#   LineName<-c("x", "bcbcg_no2_s6_b3","cacg_monomial_1_no2_s6_b3","cacg_monomial_2_no2_s6_b3")
################################################## 2014-12-05
#   solver_prefix<-c("_bcbcg_no2_s4_b3","_cacg_monomial_1_no2_s4_b3")
#   LineName<-c("x", "bcbcg_no2_s4_b3", "cacg_monomial_1_no2_s4_b3")
##############################
#   solver_prefix<-c("_bcbcg_1_1_no2_s4_b3","_cacg_monomial_1_1_no2_s4_b3")
#   LineName<-c("x", "bcbcg_1_1_no2_s4_b3", "cacg_monomial_1_1_no2_s4_b3")
##############################
############################## 2014-12-05
#   solver_prefix<-c("_bcg_no2_s1_b1","_bcg_no2_s1_b4","_bcbcg_1_1_no2_s8_b1","_bcbcg_1_1_no2_s2_b1","_bcbcg_1_1_no2_s2_b16")
#   LineName<-c("x", "cg", "bcg_m4","bcbcg_s8m1","bcbcg_s2m1","bcbcg_s2m16")
##############################
#   solver_prefix<-c("_bcg_no2_s1_b1","_bcg_no2_s1_b4")
#   LineName<-c("x", "bcg_no2_s1_b1", "bcg_no2_s1_b4")
##############################
#   solver_prefix<-c("_bcg_no2_s1_b1","_bcg_no2_s1_b4","_bcbcg_1_1_no2_s8_b1","_bcbcg_1_1_no2_s2_b16")
#   LineName<-c("x", "bcg_no2_s1_b1", "bcg_no2_s1_b4","bcbcg_s8_b1","bcbcg_s2_b16")
##############################
#   solver_prefix<-c("_bcbcg_1_1_no5_s1_b1","_bcbcg_1_1_no5_s2_b1","_bcbcg_1_1_no5_s3_b2",
#                    "_bcbcg_1_1_no6_s1_b1","_bcbcg_1_1_no6_s1_b2","_bcbcg_1_1_no6_s2_b3")
#   LineName<-c("x", "bcbcg_a_s1m1","bcbcg_a_s2m1","bcbcg_a_s3m2",
#                    "bcbcg_b_s1m1","bcbcg_b_s1m2","bcbcg_b_s2m3")
  ################################################## 2014-12-11
#   solver_prefix<-c("_bcbcg_no2_s8_b3","_cacg_monomial_1_no2_s8_b3","_cacg_monomial_2_no2_s8_b3")
#   LineName<-c("x", "bcbcg_no2_s8_b3","cacg_monomial_1_no2_s8_b3","cacg_monomial_2_no2_s8_b3")
  ##############################
  solver_prefix<-c("_bcbcg_no2_s10_b3","_cacg_monomial_1_no2_s10_b3","_cacg_monomial_2_no2_s10_b3")
  LineName<-c("x", "bcbcg_no2_s10_b3","cacg_monomial_1_no2_s10_b3","cacg_monomial_2_no2_s10_b3")
################################
##############################
##############################

  dataToPlot<-data.frame(c(1:maxIter));
  
  for (prefix_id in 1:length(solver_prefix)) {
    #for (prefix_id in 1:1) {
    file_to_read<-sprintf("%s%s.csv",matrixName, solver_prefix[prefix_id])
    MatrixTemp <-read.csv(file_to_read,sep=",",header=F)
    Temp<-MatrixTemp[,2]; 
    length(Temp)<-maxIter;
    dataToPlot<-cbind(dataToPlot, Temp)
  }
  
  dataToPlot[is.na(dataToPlot)]<-lineLowerBound;
  colnames(dataToPlot)<-LineName;
  PlotConvergenceHistoryWithXY_SingleMatrixMultipleSolver(dataToPlot, x_axis_gap=10, tol=tolerence, 
                                                         ,figTitle=matrixName, linelowerest = lineLowerBound
                                                         , cexVal=1, legendPos="topright",range_factor=1.4)
}

###########################################################################################

main_residual()

############################################################################################


