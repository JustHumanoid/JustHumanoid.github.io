orgaan<-c(1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4)

(lever = 1, nier = 2, milt = 3, kieuw = 4)

vis<-c(1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5)

metaal<-c(2.5,1.2,4.9,8.6,2.3,1.4,6.8,15.1,0.5,0.4,7.8,4.3,6.4,3.2,13.4,28.2,0.1,0,2.3,1.9)

orgaan<-as.factor(orgaan)
vis<-as.factor(vis)

lm1<-lm(metaal~orgaan+vis)
anova(lm1)


TukeyHSD(aov(metaal~orgaan+vis)

shapiro.test(lm1$residuals)


