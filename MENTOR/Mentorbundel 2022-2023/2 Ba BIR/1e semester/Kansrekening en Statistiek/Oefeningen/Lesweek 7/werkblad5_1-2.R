# oefening 1: Inkomen en opleidingsniveauw

X <- 1:4
pX <- c(0.24,0.49,0.2,0.07)
EX <-sum(X*pX)
varX <-sum((X-2.1)^2*pX)

Y <- 1:2
pY <- c(0.75,0.25)
EY <-sum(Y*pY)
varY <-sum((Y-1.25)^2*pY)

EXY <- 1*1*0.23+1*2*0.40+1*3*0.1+1*4*0.02+2*1*0.01+2*2*0.09+2*3*0.1+2*4*0.05
covXY <- EXY - EX*EY

EZ <- EX+2*EY
varZ <- varX +4*varY+4*covXY
EX+2*(varY+EY*EY)

# oefening 2: Bevolking
pol <- read.table('pollutiedataset.txt', header=T)
attach(pol)
hist(pop)
mean(pop,na.rm=T)
var(pop,na.rm=T)
var(pop,na.rm=T)/(length(pop)-1)

1-pnorm(2000000,mean(pop,na.rm=T),sd(pop,na.rm=T)/sqrt(59))
1-pnorm(1000000,mean(pop,na.rm=T),sd(pop,na.rm=T)/sqrt(59))
