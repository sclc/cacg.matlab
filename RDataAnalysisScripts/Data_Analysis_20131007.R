#################
epsilon = 1e-6
###bcsstk16
# setwd("C:\\Users\\sc2012\\Dropbox\\Daily_Doc\\20130706\\ExpData\\bcsstk16") 
setwd("/home/scl/SVN_SAKURA/SparseLinAlgScilab/cg")
MatrixNameList<-readLines("MatrixNameList.txt")
#######################################
setwd("/home/scl/SVN_SAKURA/SparseLinAlgScilab/cg/ResultDataTempDir")
#######################################
MatrixNameListLength=length(MatrixNameList)
prefix<-c("cg_regular_","bcg_m4_","cbcg_k4_","bcbcg_m2k2_")
LineName<-c("cg","bcg_m4","cbcg_k4","bcbcg_m2k2")

Result<-matrix(nrow=MatrixNameListLength,ncol=length(prefix))

for(matrix_id in 1:MatrixNameListLength){
  for (prefix_id in 1:length(prefix)) {
    file_to_read<-sprintf("%s%s.csv",prefix[prefix_id],MatrixNameList[matrix_id])
    MatrixTemp <-read.csv(file_to_read,sep=" ",header=F)
    Result[matrix_id, prefix_id]<-(dim(MatrixTemp))[1]
  }
}
######################################
##pic 1  
xrange<-c(1,MatrixNameListLength)
yrange<-c(1,max(Result))
x<-seq(1:MatrixNameListLength)
plot(xrange,yrange,type="n",log="y",xlab="Matrices",ylab="#Iterations",xaxt="n",yaxt="n")
linetype <- c(1:length(prefix))
colors <- rainbow(length(prefix))
plotchar <- seq(18, 18+length(prefix), 1)
for (prefix_id in 1:length(prefix)) {
  lines(x, Result[,prefix_id]
        ,type="b"
        ,lwd=3
        ,lty=linetype[prefix_id]
        ,col=colors[prefix_id]
  )
}
abline(h=2500)
axis(side=1, at=seq(0,xrange[2],1))
y_log10<-floor(log10(yrange))
y_axis<-seq(y_log10[1],y_log10[2]+1,by=1)
axis(side=2, at=10^y_axis)
grid(nx=10,ny=10,col="black")
title("Solver Comparision")
##
legend(
  "topright", 
  #   xrange[2]/range_factor + 50, yrange[2]
  #        0,0
  ,LineName
  ,cex=0.8
  ,col=colors
  ,pch=plotchar
  ,lty=linetype
  ,border="black"
  ,bty="o"
  #       ,box.col="black"
  #       ,fill="yellow"
  #       ,title="Tree"
)
######################################
######################################
######################################
SortedRes<-Result[sort.list(Result[,1]),]
SortedMatrixNameList<-MatrixNameList[sort.list(Result[,1])]
##pic 2 
xrange<-c(1,MatrixNameListLength)
yrange<-c(1,max(Result))
x<-seq(1:MatrixNameListLength)
plot(xrange,yrange,type="n",log="y",xlab="Sorted Matrices",ylab="#Iterations",xaxt="n",yaxt="n")
linetype <- c(1:length(prefix))
colors <- rainbow(length(prefix))
plotchar <- seq(18, 18+length(prefix), 1)
for (prefix_id in 1:length(prefix)) {
  lines(x, SortedRes[,prefix_id]
        ,type="b"
        ,lwd=3
        ,lty=linetype[prefix_id]
        ,col=colors[prefix_id]
  )
}
abline(h=2500)
axis(side=1, at=seq(0,xrange[2],1))
y_log10<-floor(log10(yrange))
y_axis<-seq(y_log10[1],y_log10[2]+1,by=1)
axis(side=2, at=10^y_axis)
grid(nx=10,ny=10,col="black")
title("Solver Comparision")
##
legend(
  "bottomright", 
  #   xrange[2]/range_factor + 50, yrange[2]
  #        0,0
  ,LineName
  ,cex=0.8
  ,col=colors
  ,pch=plotchar
  ,lty=linetype
  ,border="black"
  ,bty="o"
  #       ,box.col="black"
  #       ,fill="yellow"
  #       ,title="Tree"
)
######################################
######################################
######################################
cgDIVcbcg<-SortedRes[,1]/SortedRes[,3]
cgDIVbcbcg<-SortedRes[,1]/SortedRes[,4]
