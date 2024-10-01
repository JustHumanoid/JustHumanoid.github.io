v<-read.table('vochtbeton.txt',header=T)
attach(v)
names(v)

boxplot(vocht~behand)

beh<-as.factor(behand)
lm1<-lm(vocht~beh)
anova(lm1)

bartlett.test(vocht~beh)
shapiro.test(lm1$residuals)

pairwise.t.test(vocht,beh,p.adj='none')
pairwise.t.test(vocht,beh,p.adj='bonferroni')

TukeyHSD(aov(vocht~beh))

kruskal.test(vocht~beh)

pairwise.wilcox.test(vocht,beh,p.adj='none')
pairwise.wilcox.test(vocht,beh,p.adj='bonferroni')

rm(list=ls())
b<-read.table('batch.txt',header=T)
attach(b)
names(b)

Batch<-as.factor(Batch)

lm2<-lm(prod~Batch)
anova(lm2)

(12.852-3.048)/7


rm(list=ls())
d<-read.table('druk.txt',header=T)
attach(d)

x<-cbind(weerg,druk,temp)
pairs(x)

#simple linear regression

lm1<-lm(weerg~druk)
plot(druk,weerg)
abline(lm1)
new2<-data.frame(druk=c(0:10))
pc<-predict(lm1,interval='confidence',newdata=new2,se=T)
pp<-predict(lm1,interval='prediction',newdata=new2,se=T)
matlines(new2,pc$fit,lty=c(1,2,2),col=c('black','red','red'))
matlines(new2,pp$fit,lty=c(1,2,2),col=c('black','green','green'))


new<-data.frame(druk=5.5)
predict(lm1,interval='confidence',newdata=new)
predict(lm1,interval='prediction',newdata=new)


par(mfrow=c(2,2))
plot(lm1)
par(mfrow=c(1,1))


cor.test(weerg,druk,method='spearman')

