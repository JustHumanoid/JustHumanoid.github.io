#black = ras moeder 1=yes, 0=no),
#educ = aantal jaren opleiding (0,17),
#smoke = roken tijdens zwangerschap (1=yes, 0=no),
#gestate = Gestational age in weken
#grams = geboortegewicht

ph<-read.table('phbirths.txt',header=T)
attach(ph)

lm1<-lm(grams~black+smoke+educ+gestate+
smoke:black+black:gestate+black:educ+smoke:gestate+smoke:educ+gestate:educ)

anova(lm1)
summary(lm1)

lm2<-lm(grams~black+educ+smoke+gestate+smoke:black+black:educ)
summary(lm2)

#aparte hellingen en aparte effecten van roken: educ en smoke eruit

lm2b<-lm(grams~black+gestate+smoke:black+black:educ)
summary(lm2b)


par(mfrow=c(2,2))
plot(lm2)
par(mfrow=c(1,1))

plot(educ,grams, type='n')
points(educ[black=='YES'],grams[black=='YES'],pch=19)
points(educ[black=='NO']+0.2,grams[black=='NO'],pch=1)
abline(lm(grams[black=='YES']~educ[black=='YES']),lty=1)
abline(lm(grams[black=='NO']~educ[black=='NO']),lty=2)
legend(20,5000,legend=c('black','not black'),bty='n',pch=c(19,1),lty=c(1,2))

#residual plot: maak model zonder de factoren/variabelen waarin je geinteresseerd bent en 
#dan plot van de residuele waarden

lm3<-lm(grams~black+smoke+gestate+smoke:black)
res<-lm3$residuals

plot(educ,res, type='n')
points(educ[black=='YES'],res[black=='YES'],pch=19)
points(educ[black=='NO']+0.2,res[black=='NO'],pch=1)
abline(lm(res[black=='YES']~educ[black=='YES']),lty=1)
abline(lm(res[black=='NO']~educ[black=='NO']),lty=2)
legend(0,1500,legend=c('black','not black'),bty='n',pch=c(19,1),lty=c(1,2))

