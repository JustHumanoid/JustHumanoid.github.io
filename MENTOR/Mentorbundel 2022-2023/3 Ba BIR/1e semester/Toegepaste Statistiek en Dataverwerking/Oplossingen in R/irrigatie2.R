irri2<-read.table('irrigatie2.txt',header=T)
attach(irri2)
irri2

A<-as.factor(A)
B<-as.factor(B)


lm1<-lm(Y~A+B:A)
anova(lm1)

Fnew<-(357.35/35.61)
1-pf(Fnew,1,6)

boxplot(Y~A)
