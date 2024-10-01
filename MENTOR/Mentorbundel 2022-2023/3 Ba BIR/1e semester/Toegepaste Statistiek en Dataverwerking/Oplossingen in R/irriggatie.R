irri<-read.table('irrigatie.txt',header=T)
attach(irri)
irri

A<-as.factor(A)
B<-as.factor(B)

lm1<-lm(Y~A+B+A:B)
anova(lm1)

