b<-read.table('botervet.txt',header=T)
attach(b)
b

lm1<-lm(Butterfat~Breed+Age+Breed:Age)
anova(lm1)

(interactie kan eruit)

lm2<-lm(Butterfat~Breed+Age)
anova(lm2)

(leeftijd kan er ook uit)

lm3<-lm(Butterfat~Breed)
anova(lm3)

TukeyHSD(aov(Butterfat~Breed))
boxplot(Butterfat~Breed)

