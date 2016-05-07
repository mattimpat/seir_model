require("GillespieSSA")
parms <- c(beta=0.003, gamma=1, mu=1)
x0 <- c(S=1990,E=0,I=10,R=0)
a <- c("beta*S*I","gamma*E","mu*I")
nu <- matrix(c(-1,0,0,+1,-1,0,0,+1,-1,0,0,+1),nrow=4,byrow=TRUE)
x11(width=8,height=6)
par(mar=c(4,4,1,1),mgp=c(2.5,1,0))
plot(x=1:10,col=rgb(0,0,0,0),ylim=c(0,2000),xlab="Time",ylab="Host",cex.lab=1.5)
for(i in 1:100)
{
  out <- ssa(x0,a,nu,parms,tf=10,simName="SEIR Model")
  lines(x=out$data[,1],out$data[,2],col=rgb(0.14,0.48,0.14,0.4))
  lines(x=out$data[,1],out$data[,3],col=rgb(0.79,0.14,0.14,0.4))
  lines(x=out$data[,1],out$data[,4],col=rgb(0.82,0.44,0.05,0.4))
  lines(x=out$data[,1],out$data[,5],col=rgb(0.44,0.26,0.61,0.4))
}
legend("right",legend=c("S","E","I","R"),lty=1,col=c(rgb(0.14,0.48,0.14),
                                                     rgb(0.79,0.14,0.14),
                                                     rgb(0.82,0.44,0.05),
                                                     rgb(0.44,0.26,0.61)),lwd=3)
