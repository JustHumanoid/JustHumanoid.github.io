bedr<-c(1,2,3,4,5,1,2,3,4,5,1,2,3,4,5)
vet<-c(123,145,132,167,142,118,155,128,158,150,120,148,130,162,154)

bedr<-as.factor(bedr)
lm2<-lm(vet~bedr)

anova(lm2)

var_vet<-((843.8-18.9)/3)
var_vet
('das groot, te groot')

boxplot(vet~bedr)