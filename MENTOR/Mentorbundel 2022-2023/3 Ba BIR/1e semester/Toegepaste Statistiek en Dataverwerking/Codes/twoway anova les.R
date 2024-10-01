###########
#vocht
############

v<-read.table('vochtbeton.txt',header=T)
attach(v)

behand<-as.factor(behand)
dag<-as.factor(dag)

lm1<-lm(vocht~behand+dag)
anova(lm1)

TukeyHSD(aov(vocht~behand+dag))

#########
#konijnen
#########

k<-read.table('konijn.txt',header=T)
attach(k)
names(k)

lm1<-lm(groei~kooi+sex+kooi:sex)
anova(lm1)
lm1

TukeyHSD(aov(groei~kooi+sex+kooi:sex))


lm1m<-lm(groei[sex=='m']~kooi[sex=='m'])
anova(lm1m)
TukeyHSD(aov(groei[sex=='m']~kooi[sex=='m']))

lm1v<-lm(groei[sex=='v']~kooi[sex=='v'])
anova(lm1v)
TukeyHSD(aov(groei[sex=='v']~kooi[sex=='v']))

##############
#meta-analyse: combineren data van verschillende labo's
##############

m<-read.table('metaanalyse.txt',header=T)
attach(m)
names(m)

lm2<-lm(kapa~behand+studie+behand:studie)
anova(lm2)

fnew<-6.4099/1.32
pf(fnew,3,12,lower.tail=F)

boxplot(kapa~behand)

######################
#nested ANOVA
#######################


n<-read.table('nested1.txt',header=T)
attach(n)
names(n)

lm3<-lm(kapa~behand+behand:studie)
anova(lm3)

fnew<-6.4099/1.3587
pf(fnew,3,16,lower.tail=F)

boxplot(kapa~behand)
