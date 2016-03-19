###################################
####To plot using x and y data given by argument
PlotConvergenceHistoryWithXY_SingleMatrixMultipleSolver_region <- function(dataframeToPlot
                                                                    ,figTitle="Convergence History",y_axis_label="log(||r1||/||b1||)"
                                                                    ,legendPos="topright",range_factor=1.0, x_axis_gap=20, y_axis_gap=1
                                                                    ,tol=1e-16, linelowerest = 1e-16, cexVal=1.0
                                                                    ,startP=1, endP=length(dataframeToPlot[,1]) 
                                                                    ,titleSize=1 )
{
  dataframeToPlot[is.na(dataframeToPlot)]<-linelowerest;
  num_solver_types<-ncol(dataframeToPlot) - 1 ;
  #xrange<-range(dataframeToPlot[,1]);
  xrange<-c(startP,endP)
  ##since all algorithm follows x=1, and epsilon=1e-15
  #yrange<-range(dataframeToPlot[,2:(num_solver_types+1)]);
  yrange<-range(dataframeToPlot[startP:endP,2:(num_solver_types+1)]);
  
  if (yrange[1]==-Inf) {
    is.na(dataframeToPlot)<-sapply(dataframeToPlot,is.infinite);
    dataframeToPlot[is.na(dataframeToPlot)]<-linelowerest;
    yrange<-range(dataframeToPlot[,2:(num_solver_types+1)]);
  } 
  
  xrange[2]<-xrange[2]*range_factor;
  
  plot(xrange,yrange,log="y",type="n",xlab="#Iteration",ylab=y_axis_label,xaxt="n",yaxt="n")
  colors <- rainbow(num_solver_types);
  ##
  linetype <- c(1:num_solver_types);
  plotchar <- seq(18, 18+num_solver_types, 1)
  abline(h=linelowerest)
  for (i in 1:num_solver_types) {
    x<-dataframeToPlot[,1];
    y<-dataframeToPlot[,(i+1)];
    lines(x[startP:endP], y[startP:endP]
          ,type="l"
          ,lwd=3
          ,lty=linetype[i]
          ,col=colors[i]
          ,pch=plotchar[i]
    )
  }
  
  axis(side=1, at=seq(0,xrange[2],x_axis_gap));
  
  y_log10<-floor(log10(yrange));
  y_axis<-seq(y_log10[1],y_log10[2]+1,by=y_axis_gap);
  axis(side=2, at=10^y_axis);
  
  grid(nx=10,ny=10,col="black");
  title(figTitle, cex.main=titleSize);
  ##
  names<-colnames(dataframeToPlot)
  line_name<-names[2:ncol(dataframeToPlot)];
  legend(
    legendPos, 
    #   xrange[2]/range_factor + 50, yrange[2]
    #        0,0
    ,line_name
    ,cex=cexVal
    ,col=colors
    ,pch=plotchar
    ,lty=linetype
    ,border="black"
    ,bty="o"
    #       ,box.col="black"
    #       ,fill="yellow"
    #       ,title="Tree"
  )
}
###################################