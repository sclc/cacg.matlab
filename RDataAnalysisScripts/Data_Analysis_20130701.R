#svm classification, so spmvTD_BC_R_cls.dat is employed
# setwd("C:\\Users\\sc2012\\Dropbox\\Daily_Doc\\20130701\\ExpData")
setwd("/home/sc2012/Dropbox/Daily_Doc/20130701/ExpData")
# library(e1071)
# library(DMwR)
# colname<-c("eigen-value")
# eigen_A_bcsstk16_np<-read.csv("eigen_A_bcsstk16_np.csv", sep=",", header=F, col.names=colname)

eigen_A_bcsstk16_np<-read.csv("eigen_A_bcsstk16_np.csv", sep=",", header=F)
eigen_A_bcsstk16_p1<-read.csv("eigen_A_bcsstk16_p1.csv", sep=",", header=F)
eigen_A_crystm01_np<-read.csv("eigen_A_crystm01_np.csv", sep=",", header=F)
eigen_A_crystm01_p1<-read.csv("eigen_A_crystm01_p1.csv", sep=",", header=F)

# x_axis_eigen_A_bcsstk16_np<-seq(1,length(eigen_A_bcsstk16_np))
x_axis_eigen_A_bcsstk16_np<-1:length(eigen_A_bcsstk16_np)
x_axis_eigen_A_bcsstk16_p1<-1:length(eigen_A_bcsstk16_p1)
x_axis_eigen_A_crystm01_np<-1:length(eigen_A_crystm01_np)
x_axis_eigen_A_crystm01_p1<-1:length(eigen_A_crystm01_p1)


xrange<-range(x_axis_eigen_A_bcsstk16_np,x_axis_eigen_A_bcsstk16_p1,x_axis_eigen_A_crystm01_np,x_axis_eigen_A_crystm01_p1)
yrange<-range(eigen_A_bcsstk16_np, eigen_A_bcsstk16_p1 , eigen_A_crystm01_np, eigen_A_crystm01_p1)
range_factor<-1.2
xrange[2]<-xrange[2]*range_factor

x_axis_name<-c("x_axis_eigen_A_bcsstk16_np","x_axis_eigen_A_bcsstk16_p1",
               "x_axis_eigen_A_crystm01_np","x_axis_eigen_A_crystm01_p1")
y_axis_name<-c("eigen_A_bcsstk16_np","eigen_A_bcsstk16_p1",
               "eigen_A_crystm01_np","eigen_A_crystm01_p1")

plot(xrange,yrange,log="y",type="n",xlab="#eigen-value",ylab="log(eigen-value)",xaxt="n",yaxt="n")
colors <- rainbow(length(y_axis_name))

linetype <- c(1:length(y_axis_name))
plotchar <- seq(18, 18+length(y_axis_name), 1)
for (i in 1:length(y_axis_name)) {
  x<-eval(parse(text=x_axis_name[i]))
  y<-eval(parse(text=y_axis_name[i]))
  
  lines(x, y
        ,type="l"
        ,lwd=3
        ,lty=linetype[i]
        ,col=colors[i]
        ,pch=plotchar[i]
  )
}
axis(side=1, at=seq(0,xrange[2],100))
y_log10<-floor(log10(yrange))
y_axis<-seq(y_log10[1],y_log10[2]+1,by=1)
axis(side=2, at=10^y_axis)
grid(nx=10,ny=10,col="black")
title("Eigen-value distribution", "Eigen-value Analysis")

legend(
      "topright", 
#   xrange[2]/range_factor + 50, yrange[2]
#        0,0
      ,y_axis_name,
       cex=0.55
      ,col=colors
      ,pch=plotchar
      ,lty=linetype
      ,border="black"
      ,bty="o"
#       ,box.col="black"
#       ,fill="yellow"
#       ,title="Tree"
)
