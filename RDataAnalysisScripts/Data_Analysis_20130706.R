#################
epsilon = 1e-15
###bcsstk16
setwd("C:\\Users\\sc2012\\Dropbox\\Daily_Doc\\20130706\\ExpData\\bcsstk16") 

##read cg
bcsstk16_cg<-read.csv("bcsstk16_cg_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
##read bcg
bcsstk16_bcg_v1_m1<-read.csv("bcsstk16_bcg_v1_m1_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstk16_bcg_v1_m3<-read.csv("bcsstk16_bcg_v1_m3_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstk16_bcg_v1_m5<-read.csv("bcsstk16_bcg_v1_m5_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstk16_bcg_v1_m8<-read.csv("bcsstk16_bcg_v1_m8_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstk16_bcg_v1_m10<-read.csv("bcsstk16_bcg_v1_m10_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstk16_bcg_v1_m20<-read.csv("bcsstk16_bcg_v1_m20_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
##read cbcg
bcsstk16_cbcg_k3<-read.csv("bcsstk16_cbcg_k3_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstk16_cbcg_k5<-read.csv("bcsstk16_cbcg_k5_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstk16_cbcg_k8<-read.csv("bcsstk16_cbcg_k8_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstk16_cbcg_k10<-read.csv("bcsstk16_cbcg_k10_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstk16_cbcg_k20<-read.csv("bcsstk16_cbcg_k20_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
##read bcbcg
bcsstk16_bcbcg_m3k1<-read.csv("bcsstk16_bcbcg_m3k1_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstk16_bcbcg_m3k3<-read.csv("bcsstk16_bcbcg_m3k3_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstk16_bcbcg_m3k5<-read.csv("bcsstk16_bcbcg_m3k5_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstk16_bcbcg_m3k8<-read.csv("bcsstk16_bcbcg_m3k8_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstk16_bcbcg_m3k10<-read.csv("bcsstk16_bcbcg_m3k10_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstk16_bcbcg_m3k20<-read.csv("bcsstk16_bcbcg_m3k20_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstk16_bcbcg_m20k3<-read.csv("bcsstk16_bcbcg_m20k3_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstk16_bcbcg_m20k5<-read.csv("bcsstk16_bcbcg_m20k5_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstk16_bcbcg_m20k8<-read.csv("bcsstk16_bcbcg_m20k8_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
######ploting
##Theoretically cg has the longest converging process
num_ip_cg=2
num_ip_bcg=2
num_ip_cbcg=2
num_ip_bcbcg=2
#
x_axis_bcsstk16_cg<-bcsstk16_cg[,1] * num_ip_cg
x_axis_bcsstk16_bcg_v1_m1<-bcsstk16_bcg_v1_m1[,1] * num_ip_bcg
x_axis_bcsstk16_bcg_v1_m3<-bcsstk16_bcg_v1_m3[,1] * num_ip_bcg
x_axis_bcsstk16_bcg_v1_m5<-bcsstk16_bcg_v1_m5[,1] * num_ip_bcg
x_axis_bcsstk16_bcg_v1_m8<-bcsstk16_bcg_v1_m8[,1] * num_ip_bcg
x_axis_bcsstk16_bcg_v1_m10<-bcsstk16_bcg_v1_m10[,1] * num_ip_bcg
x_axis_bcsstk16_bcg_v1_m20<-bcsstk16_bcg_v1_m20[,1] * num_ip_bcg
x_axis_bcsstk16_cbcg_k3<-bcsstk16_cbcg_k3[,1] * num_ip_cbcg
x_axis_bcsstk16_cbcg_k5<-bcsstk16_cbcg_k5[,1] * num_ip_cbcg
x_axis_bcsstk16_cbcg_k8<-bcsstk16_cbcg_k8[,1] * num_ip_cbcg
x_axis_bcsstk16_cbcg_k10<-bcsstk16_cbcg_k10[,1] * num_ip_cbcg
x_axis_bcsstk16_cbcg_k20<-bcsstk16_cbcg_k20[,1] * num_ip_cbcg
x_axis_bcsstk16_bcbcg_m3k1<-bcsstk16_bcbcg_m3k1[,1] * num_ip_bcbcg
x_axis_bcsstk16_bcbcg_m3k3<-bcsstk16_bcbcg_m3k3[,1] * num_ip_bcbcg
x_axis_bcsstk16_bcbcg_m3k5<-bcsstk16_bcbcg_m3k5[,1] * num_ip_bcbcg
x_axis_bcsstk16_bcbcg_m3k8<-bcsstk16_bcbcg_m3k8[,1] * num_ip_bcbcg
x_axis_bcsstk16_bcbcg_m3k10<-bcsstk16_bcbcg_m3k10[,1] * num_ip_bcbcg
x_axis_bcsstk16_bcbcg_m3k20<-bcsstk16_bcbcg_m3k20[,1] * num_ip_bcbcg
x_axis_bcsstk16_bcbcg_m20k3<-bcsstk16_bcbcg_m20k3[,1] * num_ip_bcbcg
x_axis_bcsstk16_bcbcg_m20k5<-bcsstk16_bcbcg_m20k5[,1] * num_ip_bcbcg
x_axis_bcsstk16_bcbcg_m20k8<-bcsstk16_bcbcg_m20k8[,1] * num_ip_bcbcg
#######
y_axis_bcsstk16_cg<-bcsstk16_cg[,2]
y_axis_bcsstk16_bcg_v1_m1<-bcsstk16_bcg_v1_m1[,2]
y_axis_bcsstk16_bcg_v1_m3<-bcsstk16_bcg_v1_m3[,2]
y_axis_bcsstk16_bcg_v1_m5<-bcsstk16_bcg_v1_m5[,2]
y_axis_bcsstk16_bcg_v1_m8<-bcsstk16_bcg_v1_m8[,2]
y_axis_bcsstk16_bcg_v1_m10<-bcsstk16_bcg_v1_m10[,2]
y_axis_bcsstk16_bcg_v1_m20<-bcsstk16_bcg_v1_m20[,2]
y_axis_bcsstk16_cbcg_k3<-bcsstk16_cbcg_k3[,2]
y_axis_bcsstk16_cbcg_k5<-bcsstk16_cbcg_k5[,2]
y_axis_bcsstk16_cbcg_k8<-bcsstk16_cbcg_k8[,2]
y_axis_bcsstk16_cbcg_k10<-bcsstk16_cbcg_k10[,2]
y_axis_bcsstk16_cbcg_k20<-bcsstk16_cbcg_k20[,2]
y_axis_bcsstk16_bcbcg_m3k1<-bcsstk16_bcbcg_m3k1[,2]
y_axis_bcsstk16_bcbcg_m3k3<-bcsstk16_bcbcg_m3k3[,2]
y_axis_bcsstk16_bcbcg_m3k5<-bcsstk16_bcbcg_m3k5[,2]
y_axis_bcsstk16_bcbcg_m3k8<-bcsstk16_bcbcg_m3k8[,2]
y_axis_bcsstk16_bcbcg_m3k10<-bcsstk16_bcbcg_m3k10[,2]
y_axis_bcsstk16_bcbcg_m3k20<-bcsstk16_bcbcg_m3k20[,2]
y_axis_bcsstk16_bcbcg_m20k3<-bcsstk16_bcbcg_m20k3[,2]
y_axis_bcsstk16_bcbcg_m20k5<-bcsstk16_bcbcg_m20k5[,2]
y_axis_bcsstk16_bcbcg_m20k8<-bcsstk16_bcbcg_m20k8[,2]
###########
##pic 1  
xrange<-range(x_axis_bcsstk16_cg)
##since all algorithm follows x=1, and epsilon=1e-15
yrange<-range(y_axis_bcsstk16_cg) 
range_factor<-1.2
xrange[2]<-xrange[2]*range_factor

x_axis_name<-c("x_axis_bcsstk16_cg"
               ,"x_axis_bcsstk16_bcg_v1_m3","x_axis_bcsstk16_bcg_v1_m20"
               ,"x_axis_bcsstk16_cbcg_k3","x_axis_bcsstk16_cbcg_k20"
               ,"x_axis_bcsstk16_bcbcg_m3k3","x_axis_bcsstk16_bcbcg_m20k8")
y_axis_name<-c("y_axis_bcsstk16_cg"
              ,"y_axis_bcsstk16_bcg_v1_m3","y_axis_bcsstk16_bcg_v1_m20"
              ,"y_axis_bcsstk16_cbcg_k3","y_axis_bcsstk16_cbcg_k20"
              ,"y_axis_bcsstk16_bcbcg_m3k3","y_axis_bcsstk16_bcbcg_m20k8")

plot(xrange,yrange,log="y",type="n",xlab="Iteration(#inner products)",ylab="log(||r1||/||b1||)",xaxt="n",yaxt="n")
colors <- rainbow(length(y_axis_name))
##
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
axis(side=1, at=seq(0,xrange[2],20))
y_log10<-floor(log10(yrange))
y_axis<-seq(y_log10[1],y_log10[2]+1,by=1)
axis(side=2, at=10^y_axis)
grid(nx=10,ny=10,col="black")
title("Convergence history", "CG-type methods")
##
legend(
  "topright", 
  #   xrange[2]/range_factor + 50, yrange[2]
  #        0,0
  ,y_axis_name,
  cex=0.8
  ,col=colors
  ,pch=plotchar
  ,lty=linetype
  ,border="black"
  ,bty="o"
  #       ,box.col="black"
  #       ,fill="yellow"
  #       ,title="Tree"
)
###################################pic2
xrange<-range(x_axis_bcsstk16_bcg_v1_m1)
##since all algorithm follows x=1, and epsilon=1e-15
yrange<-range(y_axis_bcsstk16_bcg_v1_m1) 
## sometime y lower bound may be mistakenly set up as -inf
if(yrange[1] < 0) yrange[1]=epsilon
range_factor<-1.2
xrange[2]<-xrange[2]*range_factor

x_axis_name<-c("x_axis_bcsstk16_bcg_v1_m1"
               ,"x_axis_bcsstk16_bcg_v1_m3","x_axis_bcsstk16_bcg_v1_m5"
               ,"x_axis_bcsstk16_bcg_v1_m8","x_axis_bcsstk16_bcg_v1_m10"
               ,"x_axis_bcsstk16_bcg_v1_m20")
y_axis_name<-c("y_axis_bcsstk16_bcg_v1_m1"
               ,"y_axis_bcsstk16_bcg_v1_m3","y_axis_bcsstk16_bcg_v1_m5"
               ,"y_axis_bcsstk16_bcg_v1_m8","y_axis_bcsstk16_bcg_v1_m10"
               ,"y_axis_bcsstk16_bcg_v1_m20")

plot(xrange,yrange,log="y",type="n",xlab="Iteration(#inner products)",ylab="log(||r1||/||b1||)",xaxt="n",yaxt="n")
colors <- rainbow(length(y_axis_name))
##
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
axis(side=1, at=seq(0,xrange[2],20))
y_log10<-floor(log10(yrange))
y_axis<-seq(y_log10[1],y_log10[2]+1,by=1)
axis(side=2, at=10^y_axis)
grid(nx=10,ny=10,col="black")
title("Convergence history", "BCG")
##
legend(
  "topright", 
  #   xrange[2]/range_factor + 50, yrange[2]
  #        0,0
  ,y_axis_name,
  cex=0.8
  ,col=colors
  ,pch=plotchar
  ,lty=linetype
  ,border="black"
  ,bty="o"
  #       ,box.col="black"
  #       ,fill="yellow"
  #       ,title="Tree"
)
###################################pic3
xrange<-range(x_axis_bcsstk16_cbcg_k3)
##since all algorithm follows x=1, and epsilon=1e-15
yrange<-range(y_axis_bcsstk16_cbcg_k3) 
## sometime y lower bound may be mistakenly set up as -inf
if(yrange[1] < 0) yrange[1]=epsilon
range_factor<-1.2
xrange[2]<-xrange[2]*range_factor

x_axis_name<-c("x_axis_bcsstk16_cbcg_k3"
               ,"x_axis_bcsstk16_cbcg_k8","x_axis_bcsstk16_cbcg_k20"
               ,"x_axis_bcsstk16_bcbcg_m3k3","x_axis_bcsstk16_bcbcg_m3k8"
               ,"x_axis_bcsstk16_bcbcg_m3k20","x_axis_bcsstk16_bcbcg_m20k3"
               ,"x_axis_bcsstk16_bcbcg_m20k8")
y_axis_name<-c("y_axis_bcsstk16_cbcg_k3"
               ,"y_axis_bcsstk16_cbcg_k8","y_axis_bcsstk16_cbcg_k20"
               ,"y_axis_bcsstk16_bcbcg_m3k3","y_axis_bcsstk16_bcbcg_m3k8"
               ,"y_axis_bcsstk16_bcbcg_m3k20","y_axis_bcsstk16_bcbcg_m20k3"
               ,"y_axis_bcsstk16_bcbcg_m20k8")

plot(xrange,yrange,log="y",type="n",xlab="Iteration(#inner products)",ylab="log(||r1||/||b1||)",xaxt="n",yaxt="n")
colors <- rainbow(length(y_axis_name))
##
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
axis(side=1, at=seq(0,xrange[2],20))
y_log10<-floor(log10(yrange))
y_axis<-seq(y_log10[1],y_log10[2]+1,by=1)
axis(side=2, at=10^y_axis)
grid(nx=10,ny=10,col="black")
title("Convergence history", "CBCG vs BCBCG")
##
legend(
  "topright", 
  #   xrange[2]/range_factor + 50, yrange[2]
  #        0,0
  ,y_axis_name,
  cex=0.8
  ,col=colors
  ,pch=plotchar
  ,lty=linetype
  ,border="black"
  ,bty="o"
  #       ,box.col="black"
  #       ,fill="yellow"
  #       ,title="Tree"
)

##############################################################################
###crystm01
epsilon = 1e-15
setwd("C:\\Users\\sc2012\\Dropbox\\Daily_Doc\\20130706\\ExpData\\crystm01")

##read cg
crystm01_cg<-read.csv("crystm01_cg_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
##read bcg
crystm01_bcg_v1_m1<-read.csv("crystm01_bcg_v1_m1_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
crystm01_bcg_v1_m3<-read.csv("crystm01_bcg_v1_m3_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
crystm01_bcg_v1_m5<-read.csv("crystm01_bcg_v1_m5_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
crystm01_bcg_v1_m8<-read.csv("crystm01_bcg_v1_m8_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
crystm01_bcg_v1_m10<-read.csv("crystm01_bcg_v1_m10_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
crystm01_bcg_v1_m20<-read.csv("crystm01_bcg_v1_m20_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
##read cbcg
crystm01_cbcg_k3<-read.csv("crystm01_cbcg_k3_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
crystm01_cbcg_k5<-read.csv("crystm01_cbcg_k5_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
crystm01_cbcg_k8<-read.csv("crystm01_cbcg_k8_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
crystm01_cbcg_k10<-read.csv("crystm01_cbcg_k10_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
crystm01_cbcg_k20<-read.csv("crystm01_cbcg_k20_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
##read bcbcg
crystm01_bcbcg_m3k1<-read.csv("crystm01_bcbcg_m3k1_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
crystm01_bcbcg_m3k3<-read.csv("crystm01_bcbcg_m3k3_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
crystm01_bcbcg_m3k5<-read.csv("crystm01_bcbcg_m3k5_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
crystm01_bcbcg_m3k8<-read.csv("crystm01_bcbcg_m3k8_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
crystm01_bcbcg_m3k10<-read.csv("crystm01_bcbcg_m3k10_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
crystm01_bcbcg_m3k20<-read.csv("crystm01_bcbcg_m3k20_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
crystm01_bcbcg_m20k3<-read.csv("crystm01_bcbcg_m20k3_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
crystm01_bcbcg_m20k5<-read.csv("crystm01_bcbcg_m20k5_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
crystm01_bcbcg_m20k8<-read.csv("crystm01_bcbcg_m20k8_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
######ploting
##Theoretically cg has the longest converging process
num_ip_cg=2
num_ip_bcg=2
num_ip_cbcg=2
num_ip_bcbcg=2
#
x_axis_crystm01_cg<-crystm01_cg[,1] * num_ip_cg
x_axis_crystm01_bcg_v1_m1<-crystm01_bcg_v1_m1[,1] * num_ip_bcg
x_axis_crystm01_bcg_v1_m3<-crystm01_bcg_v1_m3[,1] * num_ip_bcg
x_axis_crystm01_bcg_v1_m5<-crystm01_bcg_v1_m5[,1] * num_ip_bcg
x_axis_crystm01_bcg_v1_m8<-crystm01_bcg_v1_m8[,1] * num_ip_bcg
x_axis_crystm01_bcg_v1_m10<-crystm01_bcg_v1_m10[,1] * num_ip_bcg
x_axis_crystm01_bcg_v1_m20<-crystm01_bcg_v1_m20[,1] * num_ip_bcg
x_axis_crystm01_cbcg_k3<-crystm01_cbcg_k3[,1] * num_ip_cbcg
x_axis_crystm01_cbcg_k5<-crystm01_cbcg_k5[,1] * num_ip_cbcg
x_axis_crystm01_cbcg_k8<-crystm01_cbcg_k8[,1] * num_ip_cbcg
x_axis_crystm01_cbcg_k10<-crystm01_cbcg_k10[,1] * num_ip_cbcg
x_axis_crystm01_cbcg_k20<-crystm01_cbcg_k20[,1] * num_ip_cbcg
x_axis_crystm01_bcbcg_m3k1<-crystm01_bcbcg_m3k1[,1] * num_ip_bcbcg
x_axis_crystm01_bcbcg_m3k3<-crystm01_bcbcg_m3k3[,1] * num_ip_bcbcg
x_axis_crystm01_bcbcg_m3k5<-crystm01_bcbcg_m3k5[,1] * num_ip_bcbcg
x_axis_crystm01_bcbcg_m3k8<-crystm01_bcbcg_m3k8[,1] * num_ip_bcbcg
x_axis_crystm01_bcbcg_m3k10<-crystm01_bcbcg_m3k10[,1] * num_ip_bcbcg
x_axis_crystm01_bcbcg_m3k20<-crystm01_bcbcg_m3k20[,1] * num_ip_bcbcg
x_axis_crystm01_bcbcg_m20k3<-crystm01_bcbcg_m20k3[,1] * num_ip_bcbcg
x_axis_crystm01_bcbcg_m20k5<-crystm01_bcbcg_m20k5[,1] * num_ip_bcbcg
x_axis_crystm01_bcbcg_m20k8<-crystm01_bcbcg_m20k8[,1] * num_ip_bcbcg
#######
y_axis_crystm01_cg<-crystm01_cg[,2]
y_axis_crystm01_bcg_v1_m1<-crystm01_bcg_v1_m1[,2]
y_axis_crystm01_bcg_v1_m3<-crystm01_bcg_v1_m3[,2]
y_axis_crystm01_bcg_v1_m5<-crystm01_bcg_v1_m5[,2]
y_axis_crystm01_bcg_v1_m8<-crystm01_bcg_v1_m8[,2]
y_axis_crystm01_bcg_v1_m10<-crystm01_bcg_v1_m10[,2]
y_axis_crystm01_bcg_v1_m20<-crystm01_bcg_v1_m20[,2]
y_axis_crystm01_cbcg_k3<-crystm01_cbcg_k3[,2]
y_axis_crystm01_cbcg_k5<-crystm01_cbcg_k5[,2]
y_axis_crystm01_cbcg_k8<-crystm01_cbcg_k8[,2]
y_axis_crystm01_cbcg_k10<-crystm01_cbcg_k10[,2]
y_axis_crystm01_cbcg_k20<-crystm01_cbcg_k20[,2]
y_axis_crystm01_bcbcg_m3k1<-crystm01_bcbcg_m3k1[,2]
y_axis_crystm01_bcbcg_m3k3<-crystm01_bcbcg_m3k3[,2]
y_axis_crystm01_bcbcg_m3k5<-crystm01_bcbcg_m3k5[,2]
y_axis_crystm01_bcbcg_m3k8<-crystm01_bcbcg_m3k8[,2]
y_axis_crystm01_bcbcg_m3k10<-crystm01_bcbcg_m3k10[,2]
y_axis_crystm01_bcbcg_m3k20<-crystm01_bcbcg_m3k20[,2]
y_axis_crystm01_bcbcg_m20k3<-crystm01_bcbcg_m20k3[,2]
y_axis_crystm01_bcbcg_m20k5<-crystm01_bcbcg_m20k5[,2]
y_axis_crystm01_bcbcg_m20k8<-crystm01_bcbcg_m20k8[,2]
###########
##pic 1  
xrange<-range(x_axis_crystm01_cg)
##since all algorithm follows x=1, and epsilon=1e-15
yrange<-range(y_axis_crystm01_cg) 
range_factor<-1.2
xrange[2]<-xrange[2]*range_factor

x_axis_name<-c("x_axis_crystm01_cg"
               ,"x_axis_crystm01_bcg_v1_m3","x_axis_crystm01_bcg_v1_m20"
               ,"x_axis_crystm01_cbcg_k3","x_axis_crystm01_cbcg_k20"
               ,"x_axis_crystm01_bcbcg_m3k3","x_axis_crystm01_bcbcg_m20k8")
y_axis_name<-c("y_axis_crystm01_cg"
               ,"y_axis_crystm01_bcg_v1_m3","y_axis_crystm01_bcg_v1_m20"
               ,"y_axis_crystm01_cbcg_k3","y_axis_crystm01_cbcg_k20"
               ,"y_axis_crystm01_bcbcg_m3k3","y_axis_crystm01_bcbcg_m20k8")

plot(xrange,yrange,log="y",type="n",xlab="Iteration(#inner products)",ylab="log(||r1||/||b1||)",xaxt="n",yaxt="n")
colors <- rainbow(length(y_axis_name))
##
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
axis(side=1, at=seq(0,xrange[2],20))
y_log10<-floor(log10(yrange))
y_axis<-seq(y_log10[1],y_log10[2]+1,by=1)
axis(side=2, at=10^y_axis)
grid(nx=10,ny=10,col="black")
title("Convergence history", "CG-type methods")
##
legend(
  "topright", 
  #   xrange[2]/range_factor + 50, yrange[2]
  #        0,0
  ,y_axis_name,
  cex=0.8
  ,col=colors
  ,pch=plotchar
  ,lty=linetype
  ,border="black"
  ,bty="o"
  #       ,box.col="black"
  #       ,fill="yellow"
  #       ,title="Tree"
)
###################################pic2
xrange<-range(x_axis_crystm01_bcg_v1_m1)
##since all algorithm follows x=1, and epsilon=1e-15
yrange<-range(y_axis_crystm01_bcg_v1_m1) 
## sometime y lower bound may be mistakenly set up as -inf
if(yrange[1] < 0) yrange[1]=epsilon
range_factor<-1.2
xrange[2]<-xrange[2]*range_factor

x_axis_name<-c("x_axis_crystm01_bcg_v1_m1"
               ,"x_axis_crystm01_bcg_v1_m3","x_axis_crystm01_bcg_v1_m5"
               ,"x_axis_crystm01_bcg_v1_m8","x_axis_crystm01_bcg_v1_m10"
               ,"x_axis_crystm01_bcg_v1_m20")
y_axis_name<-c("y_axis_crystm01_bcg_v1_m1"
               ,"y_axis_crystm01_bcg_v1_m3","y_axis_crystm01_bcg_v1_m5"
               ,"y_axis_crystm01_bcg_v1_m8","y_axis_crystm01_bcg_v1_m10"
               ,"y_axis_crystm01_bcg_v1_m20")

plot(xrange,yrange,log="y",type="n",xlab="Iteration(#inner products)",ylab="log(||r1||/||b1||)",xaxt="n",yaxt="n")
colors <- rainbow(length(y_axis_name))
##
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
axis(side=1, at=seq(0,xrange[2],20))
y_log10<-floor(log10(yrange))
y_axis<-seq(y_log10[1],y_log10[2]+1,by=1)
axis(side=2, at=10^y_axis)
grid(nx=10,ny=10,col="black")
title("Convergence history", "BCG")
##
legend(
  "topright", 
  #   xrange[2]/range_factor + 50, yrange[2]
  #        0,0
  ,y_axis_name,
  cex=0.8
  ,col=colors
  ,pch=plotchar
  ,lty=linetype
  ,border="black"
  ,bty="o"
  #       ,box.col="black"
  #       ,fill="yellow"
  #       ,title="Tree"
)
###################################pic3
xrange<-range(x_axis_crystm01_cbcg_k3)
##since all algorithm follows x=1, and epsilon=1e-15
yrange<-range(y_axis_crystm01_cbcg_k3) 
## sometime y lower bound may be mistakenly set up as -inf
if(yrange[1] < 0) yrange[1]=epsilon
range_factor<-1.2
xrange[2]<-xrange[2]*range_factor

x_axis_name<-c("x_axis_crystm01_cbcg_k3"
               ,"x_axis_crystm01_cbcg_k8","x_axis_crystm01_cbcg_k20"
               ,"x_axis_crystm01_bcbcg_m3k3","x_axis_crystm01_bcbcg_m3k8"
               ,"x_axis_crystm01_bcbcg_m3k20","x_axis_crystm01_bcbcg_m20k3"
               ,"x_axis_crystm01_bcbcg_m20k8")
y_axis_name<-c("y_axis_crystm01_cbcg_k3"
               ,"y_axis_crystm01_cbcg_k8","y_axis_crystm01_cbcg_k20"
               ,"y_axis_crystm01_bcbcg_m3k3","y_axis_crystm01_bcbcg_m3k8"
               ,"y_axis_crystm01_bcbcg_m3k20","y_axis_crystm01_bcbcg_m20k3"
               ,"y_axis_crystm01_bcbcg_m20k8")

plot(xrange,yrange,log="y",type="n",xlab="Iteration(#inner products)",ylab="log(||r1||/||b1||)",xaxt="n",yaxt="n")
colors <- rainbow(length(y_axis_name))
##
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
axis(side=1, at=seq(0,xrange[2],20))
y_log10<-floor(log10(yrange))
y_axis<-seq(y_log10[1],y_log10[2]+1,by=1)
axis(side=2, at=10^y_axis)
grid(nx=10,ny=10,col="black")
title("Convergence history", "CBCG vs BCBCG")
##
legend(
  "topright", 
  #   xrange[2]/range_factor + 50, yrange[2]
  #        0,0
  ,y_axis_name,
  cex=0.8
  ,col=colors
  ,pch=plotchar
  ,lty=linetype
  ,border="black"
  ,bty="o"
  #       ,box.col="black"
  #       ,fill="yellow"
  #       ,title="Tree"
)

###############################################################################
###bcsstm07
epsilon = 1e-15
setwd("C:\\Users\\sc2012\\Dropbox\\Daily_Doc\\20130706\\ExpData\\bcsstm07")

##read cg
bcsstm07_cg<-read.csv("bcsstm07_cg_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
##read bcg
bcsstm07_bcg_v1_m1<-read.csv("bcsstm07_bcg_v1_m1_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstm07_bcg_v1_m3<-read.csv("bcsstm07_bcg_v1_m3_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstm07_bcg_v1_m5<-read.csv("bcsstm07_bcg_v1_m5_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstm07_bcg_v1_m8<-read.csv("bcsstm07_bcg_v1_m8_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstm07_bcg_v1_m10<-read.csv("bcsstm07_bcg_v1_m10_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstm07_bcg_v1_m20<-read.csv("bcsstm07_bcg_v1_m20_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
##read cbcg
bcsstm07_cbcg_k3<-read.csv("bcsstm07_cbcg_k3_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstm07_cbcg_k5<-read.csv("bcsstm07_cbcg_k5_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstm07_cbcg_k8<-read.csv("bcsstm07_cbcg_k8_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstm07_cbcg_k10<-read.csv("bcsstm07_cbcg_k10_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstm07_cbcg_k20<-read.csv("bcsstm07_cbcg_k20_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
##read bcbcg
bcsstm07_bcbcg_m3k1<-read.csv("bcsstm07_bcbcg_m3k1_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstm07_bcbcg_m3k3<-read.csv("bcsstm07_bcbcg_m3k3_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstm07_bcbcg_m3k5<-read.csv("bcsstm07_bcbcg_m3k5_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstm07_bcbcg_m3k8<-read.csv("bcsstm07_bcbcg_m3k8_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstm07_bcbcg_m3k10<-read.csv("bcsstm07_bcbcg_m3k10_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstm07_bcbcg_m3k20<-read.csv("bcsstm07_bcbcg_m3k20_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstm07_bcbcg_m20k3<-read.csv("bcsstm07_bcbcg_m20k3_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstm07_bcbcg_m20k5<-read.csv("bcsstm07_bcbcg_m20k5_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
bcsstm07_bcbcg_m20k8<-read.csv("bcsstm07_bcbcg_m20k8_X=1_b_-1to1_r1overb1.csv",sep=" ",header=F)
######ploting
##Theoretically cg has the longest converging process
num_ip_cg=2
num_ip_bcg=2
num_ip_cbcg=2
num_ip_bcbcg=2
#
x_axis_bcsstm07_cg<-bcsstm07_cg[,1] * num_ip_cg
x_axis_bcsstm07_bcg_v1_m1<-bcsstm07_bcg_v1_m1[,1] * num_ip_bcg
x_axis_bcsstm07_bcg_v1_m3<-bcsstm07_bcg_v1_m3[,1] * num_ip_bcg
x_axis_bcsstm07_bcg_v1_m5<-bcsstm07_bcg_v1_m5[,1] * num_ip_bcg
x_axis_bcsstm07_bcg_v1_m8<-bcsstm07_bcg_v1_m8[,1] * num_ip_bcg
x_axis_bcsstm07_bcg_v1_m10<-bcsstm07_bcg_v1_m10[,1] * num_ip_bcg
x_axis_bcsstm07_bcg_v1_m20<-bcsstm07_bcg_v1_m20[,1] * num_ip_bcg
x_axis_bcsstm07_cbcg_k3<-bcsstm07_cbcg_k3[,1] * num_ip_cbcg
x_axis_bcsstm07_cbcg_k5<-bcsstm07_cbcg_k5[,1] * num_ip_cbcg
x_axis_bcsstm07_cbcg_k8<-bcsstm07_cbcg_k8[,1] * num_ip_cbcg
x_axis_bcsstm07_cbcg_k10<-bcsstm07_cbcg_k10[,1] * num_ip_cbcg
x_axis_bcsstm07_cbcg_k20<-bcsstm07_cbcg_k20[,1] * num_ip_cbcg
x_axis_bcsstm07_bcbcg_m3k1<-bcsstm07_bcbcg_m3k1[,1] * num_ip_bcbcg
x_axis_bcsstm07_bcbcg_m3k3<-bcsstm07_bcbcg_m3k3[,1] * num_ip_bcbcg
x_axis_bcsstm07_bcbcg_m3k5<-bcsstm07_bcbcg_m3k5[,1] * num_ip_bcbcg
x_axis_bcsstm07_bcbcg_m3k8<-bcsstm07_bcbcg_m3k8[,1] * num_ip_bcbcg
x_axis_bcsstm07_bcbcg_m3k10<-bcsstm07_bcbcg_m3k10[,1] * num_ip_bcbcg
x_axis_bcsstm07_bcbcg_m3k20<-bcsstm07_bcbcg_m3k20[,1] * num_ip_bcbcg
x_axis_bcsstm07_bcbcg_m20k3<-bcsstm07_bcbcg_m20k3[,1] * num_ip_bcbcg
x_axis_bcsstm07_bcbcg_m20k5<-bcsstm07_bcbcg_m20k5[,1] * num_ip_bcbcg
x_axis_bcsstm07_bcbcg_m20k8<-bcsstm07_bcbcg_m20k8[,1] * num_ip_bcbcg
#######
y_axis_bcsstm07_cg<-bcsstm07_cg[,2]
y_axis_bcsstm07_bcg_v1_m1<-bcsstm07_bcg_v1_m1[,2]
y_axis_bcsstm07_bcg_v1_m3<-bcsstm07_bcg_v1_m3[,2]
y_axis_bcsstm07_bcg_v1_m5<-bcsstm07_bcg_v1_m5[,2]
y_axis_bcsstm07_bcg_v1_m8<-bcsstm07_bcg_v1_m8[,2]
y_axis_bcsstm07_bcg_v1_m10<-bcsstm07_bcg_v1_m10[,2]
y_axis_bcsstm07_bcg_v1_m20<-bcsstm07_bcg_v1_m20[,2]
y_axis_bcsstm07_cbcg_k3<-bcsstm07_cbcg_k3[,2]
y_axis_bcsstm07_cbcg_k5<-bcsstm07_cbcg_k5[,2]
y_axis_bcsstm07_cbcg_k8<-bcsstm07_cbcg_k8[,2]
y_axis_bcsstm07_cbcg_k10<-bcsstm07_cbcg_k10[,2]
y_axis_bcsstm07_cbcg_k20<-bcsstm07_cbcg_k20[,2]
y_axis_bcsstm07_bcbcg_m3k1<-bcsstm07_bcbcg_m3k1[,2]
y_axis_bcsstm07_bcbcg_m3k3<-bcsstm07_bcbcg_m3k3[,2]
y_axis_bcsstm07_bcbcg_m3k5<-bcsstm07_bcbcg_m3k5[,2]
y_axis_bcsstm07_bcbcg_m3k8<-bcsstm07_bcbcg_m3k8[,2]
y_axis_bcsstm07_bcbcg_m3k10<-bcsstm07_bcbcg_m3k10[,2]
y_axis_bcsstm07_bcbcg_m3k20<-bcsstm07_bcbcg_m3k20[,2]
y_axis_bcsstm07_bcbcg_m20k3<-bcsstm07_bcbcg_m20k3[,2]
y_axis_bcsstm07_bcbcg_m20k5<-bcsstm07_bcbcg_m20k5[,2]
y_axis_bcsstm07_bcbcg_m20k8<-bcsstm07_bcbcg_m20k8[,2]
###########
##pic 1  
xrange<-range(x_axis_bcsstm07_cg)
##since all algorithm follows x=1, and epsilon=1e-15
yrange<-range(y_axis_bcsstm07_cg) 
range_factor<-1.2
xrange[2]<-xrange[2]*range_factor

x_axis_name<-c("x_axis_bcsstm07_cg"
               ,"x_axis_bcsstm07_bcg_v1_m3","x_axis_bcsstm07_bcg_v1_m20"
               ,"x_axis_bcsstm07_cbcg_k3","x_axis_bcsstm07_cbcg_k20"
               ,"x_axis_bcsstm07_bcbcg_m3k3","x_axis_bcsstm07_bcbcg_m20k8")
y_axis_name<-c("y_axis_bcsstm07_cg"
               ,"y_axis_bcsstm07_bcg_v1_m3","y_axis_bcsstm07_bcg_v1_m20"
               ,"y_axis_bcsstm07_cbcg_k3","y_axis_bcsstm07_cbcg_k20"
               ,"y_axis_bcsstm07_bcbcg_m3k3","y_axis_bcsstm07_bcbcg_m20k8")

plot(xrange,yrange,log="y",type="n",xlab="Iteration(#inner products)",ylab="log(||r1||/||b1||)",xaxt="n",yaxt="n")
colors <- rainbow(length(y_axis_name))
##
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
axis(side=1, at=seq(0,xrange[2],20))
y_log10<-floor(log10(yrange))
y_axis<-seq(y_log10[1],y_log10[2]+1,by=1)
axis(side=2, at=10^y_axis)
grid(nx=10,ny=10,col="black")
title("Convergence history", "CG-type methods")
##
legend(
  "topright", 
  #   xrange[2]/range_factor + 50, yrange[2]
  #        0,0
  ,y_axis_name,
  cex=0.8
  ,col=colors
  ,pch=plotchar
  ,lty=linetype
  ,border="black"
  ,bty="o"
  #       ,box.col="black"
  #       ,fill="yellow"
  #       ,title="Tree"
)
###################################pic2
xrange<-range(x_axis_bcsstm07_bcg_v1_m1)
##since all algorithm follows x=1, and epsilon=1e-15
yrange<-range(y_axis_bcsstm07_bcg_v1_m1) 
## sometime y lower bound may be mistakenly set up as -inf
if(yrange[1] < 0) yrange[1]=epsilon
range_factor<-1.2
xrange[2]<-xrange[2]*range_factor

x_axis_name<-c("x_axis_bcsstm07_bcg_v1_m1"
               ,"x_axis_bcsstm07_bcg_v1_m3","x_axis_bcsstm07_bcg_v1_m5"
               ,"x_axis_bcsstm07_bcg_v1_m8","x_axis_bcsstm07_bcg_v1_m10"
               ,"x_axis_bcsstm07_bcg_v1_m20")
y_axis_name<-c("y_axis_bcsstm07_bcg_v1_m1"
               ,"y_axis_bcsstm07_bcg_v1_m3","y_axis_bcsstm07_bcg_v1_m5"
               ,"y_axis_bcsstm07_bcg_v1_m8","y_axis_bcsstm07_bcg_v1_m10"
               ,"y_axis_bcsstm07_bcg_v1_m20")

plot(xrange,yrange,log="y",type="n",xlab="Iteration(#inner products)",ylab="log(||r1||/||b1||)",xaxt="n",yaxt="n")
colors <- rainbow(length(y_axis_name))
##
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
axis(side=1, at=seq(0,xrange[2],20))
y_log10<-floor(log10(yrange))
y_axis<-seq(y_log10[1],y_log10[2]+1,by=1)
axis(side=2, at=10^y_axis)
grid(nx=10,ny=10,col="black")
title("Convergence history", "BCG")
##
legend(
  "topright", 
  #   xrange[2]/range_factor + 50, yrange[2]
  #        0,0
  ,y_axis_name,
  cex=0.8
  ,col=colors
  ,pch=plotchar
  ,lty=linetype
  ,border="black"
  ,bty="o"
  #       ,box.col="black"
  #       ,fill="yellow"
  #       ,title="Tree"
)
###################################pic3
xrange<-range(x_axis_bcsstm07_cbcg_k3)
##since all algorithm follows x=1, and epsilon=1e-15
yrange<-range(y_axis_bcsstm07_cbcg_k3) 
## sometime y lower bound may be mistakenly set up as -inf
if(yrange[1] < 0) yrange[1]=epsilon
range_factor<-1.2
xrange[2]<-xrange[2]*range_factor

x_axis_name<-c("x_axis_bcsstm07_cbcg_k3"
               ,"x_axis_bcsstm07_cbcg_k8","x_axis_bcsstm07_cbcg_k20"
               ,"x_axis_bcsstm07_bcbcg_m3k3","x_axis_bcsstm07_bcbcg_m3k8"
               ,"x_axis_bcsstm07_bcbcg_m3k20","x_axis_bcsstm07_bcbcg_m20k3"
               ,"x_axis_bcsstm07_bcbcg_m20k8")
y_axis_name<-c("y_axis_bcsstm07_cbcg_k3"
               ,"y_axis_bcsstm07_cbcg_k8","y_axis_bcsstm07_cbcg_k20"
               ,"y_axis_bcsstm07_bcbcg_m3k3","y_axis_bcsstm07_bcbcg_m3k8"
               ,"y_axis_bcsstm07_bcbcg_m3k20","y_axis_bcsstm07_bcbcg_m20k3"
               ,"y_axis_bcsstm07_bcbcg_m20k8")

plot(xrange,yrange,log="y",type="n",xlab="Iteration(#inner products)",ylab="log(||r1||/||b1||)",xaxt="n",yaxt="n")
colors <- rainbow(length(y_axis_name))
##
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
axis(side=1, at=seq(0,xrange[2],20))
y_log10<-floor(log10(yrange))
y_axis<-seq(y_log10[1],y_log10[2]+1,by=1)
axis(side=2, at=10^y_axis)
grid(nx=10,ny=10,col="black")
title("Convergence history", "CBCG vs BCBCG")
##
legend(
  "topright", 
  #   xrange[2]/range_factor + 50, yrange[2]
  #        0,0
  ,y_axis_name,
  cex=0.8
  ,col=colors
  ,pch=plotchar
  ,lty=linetype
  ,border="black"
  ,bty="o"
  #       ,box.col="black"
  #       ,fill="yellow"
  #       ,title="Tree"
)


##############################################################################
########## 3 matrices comparison
xrange<-range(x_axis_bcsstk16_bcg_v1_m3, x_axis_crystm01_bcg_v1_m3,x_axis_bcsstm07_bcg_v1_m3)
##since all algorithm follows x=1, and epsilon=1e-15
yrange<-range(y_axis_bcsstk16_bcg_v1_m3, y_axis_crystm01_bcg_v1_m3,y_axis_bcsstm07_bcg_v1_m3)
if(yrange[1] < 0) yrange[1]=epsilon
range_factor<-1.2
xrange[2]<-xrange[2]*range_factor

x_axis_name<-c("x_axis_bcsstk16_bcg_v1_m3"
               ,"x_axis_bcsstk16_bcg_v1_m10","x_axis_bcsstk16_bcg_v1_m20"
               ,"x_axis_crystm01_bcg_v1_m3","x_axis_crystm01_bcg_v1_m10"
               ,"x_axis_crystm01_bcg_v1_m20"
               ,"x_axis_bcsstm07_bcg_v1_m3","x_axis_bcsstm07_bcg_v1_m10" 
               , "x_axis_bcsstm07_bcg_v1_m20")
y_axis_name<-c("y_axis_bcsstk16_bcg_v1_m3"
               ,"y_axis_bcsstk16_bcg_v1_m10","y_axis_bcsstk16_bcg_v1_m20"
               ,"y_axis_crystm01_bcg_v1_m3","y_axis_crystm01_bcg_v1_m10"
               ,"y_axis_crystm01_bcg_v1_m20"
               ,"y_axis_bcsstm07_bcg_v1_m3","y_axis_bcsstm07_bcg_v1_m10" 
               ,"y_axis_bcsstm07_bcg_v1_m20")

plot(xrange,yrange,log="y",type="n",xlab="Iteration(#inner products)",ylab="log(||r1||/||b1||)",xaxt="n",yaxt="n")
colors <- rainbow(length(y_axis_name))
##
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
axis(side=1, at=seq(0,xrange[2],20))
y_log10<-floor(log10(yrange))
y_axis<-seq(y_log10[1],y_log10[2]+1,by=1)
axis(side=2, at=10^y_axis)
grid(nx=10,ny=10,col="black")
title("Convergence history", "BCG with different matrices")
##
legend(
  "topright", 
  #   xrange[2]/range_factor + 50, yrange[2]
  #        0,0
  ,y_axis_name,
  cex=0.8
  ,col=colors
  ,pch=plotchar
  ,lty=linetype
  ,border="black"
  ,bty="o"
  #       ,box.col="black"
  #       ,fill="yellow"
  #       ,title="Tree"
)

