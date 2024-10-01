v<-read.table('vriesdroog.txt',header=T)
attach(v)
v
g<-as.factor(glyc)
s<-as.factor(snelh)
lm1<-lm(prop~g+s)
anova(lm1)

lm1

TukeyHSD(aov(prop~g+s))

boxplot(prop~g)
boxplot(prop~s)