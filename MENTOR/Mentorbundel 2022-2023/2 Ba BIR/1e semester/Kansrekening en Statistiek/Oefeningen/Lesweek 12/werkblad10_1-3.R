# oefening 1

pol <- read.table('pollutiedataset_lr.txt', header = T)
attach(pol)
plot(S02Pot,Mortality)
ls02 <- log(S02Pot)
plot(ls02,Mortality)

lm1 <- lm(Mortality~ls02)
lm1
plot(ls02,Mortality)
abline(lm1)
confint(lm1)
summary(lm1)
sigmakwa <- sum((lm1$residuals)^2)/58
sigmakwa
x0<-data.frame(ls02=log(250))
predict(lm1,interval='confidence',newdata=x0)
predict(lm1,interval='prediction',newdata=x0)
grid <- data.frame(ls02=(0:60)/10)
pc <- predict(lm1,interval='confidence',se=T,newdata=grid)
pp <- predict(lm1,interval='prediction',se=T,newdata=grid)
matlines(grid,pp$fit,col='red')
matlines(grid,pc$fit,col='blue')
mean(ls02)
shapiro.test(lm1$residuals)
qqnorm(lm1$residuals)
plot(ls02,lm1$residuals)



# oefening 2

toren <- read.table('torenpisa.txt',header=T)
attach(toren)
plot(Jaar,Helling)
lm2 <- lm(Helling~Jaar)
lm2
confint(lm2)
x0 <- data.frame(Jaar=18)
predict(lm2,interval='prediction',newdata=x0)
abline(lm2)
qqnorm(lm2$residuals)
shapiro.test(lm2$residuals)
plot(Jaar,lm2$residuals)


# oefening 3

zuurstof <- read.table('zuurstof_lr.txt', header =T)
attach(zuurstof)
lm3 <-lm(VO2~HR)
lm3
plot(HR,VO2)
abline(lm3)
confint(lm3)
summary(lm3)
x0 <- data.frame(HR=95)
predict(lm3,interval='prediction',newdata=x0)
qqnorm(lm3$residuals)
shapiro.test(lm3$residuals)
plot(HR,lm3$residuals)