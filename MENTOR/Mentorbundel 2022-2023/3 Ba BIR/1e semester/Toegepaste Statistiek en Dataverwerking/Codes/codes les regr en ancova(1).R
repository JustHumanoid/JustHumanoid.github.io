d<-read.table('druk.txt',header=T)
attach(d)

#simple linear regression

lm1<-lm(weerg~druk)
plot(druk,weerg)
abline(lm1)

new<-data.frame(druk=5.5)
predict(lm1,interval='confidence',newdata=new)
predict(lm1,interval='prediction',newdata=new)

new2<-data.frame(druk=c(0:10))
pc<-predict(lm1,interval='confidence',newdata=new2,se=T)
pp<-predict(lm1,interval='prediction',newdata=new2,se=T)
matlines(new2,pc$fit,lty=c(1,2,2),col=c('black','red','red'))
matlines(new2,pp$fit,lty=c(1,2,2),col=c('black','green','green'))

par(mfrow=c(2,2))
plot(lm1)
par(mfrow=c(1,1))


#multiple regression

lm2<-lm(weerg~druk+temp)
summary(lm2)

par(mfrow=c(2,2))
plot(lm2)
par(mfrow=c(1,1))

new<-data.frame(druk=5.5,temp=20)

predict(lm2,interval='confidence',newdata=new)
predict(lm2,interval='prediction',newdata=new)


#ANCOVA

#voorbeeld 1
g<-read.table('geboorte.txt',header=T)
attach(g)

sex<-as.factor(sex)

lm1<-lm(gewicht~duur+sex+duur:sex)
anova(lm1)
lm1
confint(lm1)

plot(duur, gewicht, type ='n')
points(duur[sex == 1], gewicht[sex == 1], pch = 1)
points(duur[sex == 2], gewicht[sex == 2], pch = 2)
abline(lm(gewicht[sex == 1] ~duur[sex == 1]), lty = 1)
abline(lm(gewicht[sex == 2] ~duur[sex == 2]), lty = 2)
legend(35, 3400, legend = c('jongen','meisje'), pch = c(1, 2), lty = c(1, 2), bty='n')


par(mfrow=c(2,2))
plot(lm1)
par(mfrow=c(1,1))



#voorbeeld 2
b<-read.table('bacterie.txt',header=T)
attach(b)

cult<-as.factor(cult)

lm1<-lm(dens~conc+cult+conc:cult)
anova(lm1)
lm1
confint(lm1)

lm2<-lm(dens~cult+conc:cult)
lm2
confint(lm2)

cult2<-4*(cult==1)+2*(cult==2)+3*(cult==3)
cult2<-as.factor(cult2)

lm3<-lm(dens~conc+cult2+conc:cult2)
anova(lm3)
lm3
confint(lm3)

cult3<-1*(cult==1)+2*(cult==2)+2*(cult==3)
cult3<-as.factor(cult3)

lm4<-lm(dens~conc+cult3+conc:cult3)
anova(lm4)
lm4
confint(lm4)

plot(conc, dens, type ='n')
points(conc[cult == 1], dens[cult == 1], pch = 1)
points(conc[cult == 2], dens[cult == 2], pch = 2)
points(conc[cult == 3], dens[cult == 3], pch = 3)
abline(lm(dens[cult == 1] ~ conc[cult == 1]), lty = 1)
abline(lm(dens[cult == 2] ~ conc[cult == 2]), lty = 2)
abline(lm(dens[cult == 3] ~ conc[cult == 3]), lty = 3)
legend(0, 2.5, legend = c('cultuur1','cultuur2','cultuur3'), pch = c(1, 2, 3), lty = c(1, 2, 3), bty ='n')




par(mfrow=c(2,2))
plot(lm4)
par(mfrow=c(1,1))


