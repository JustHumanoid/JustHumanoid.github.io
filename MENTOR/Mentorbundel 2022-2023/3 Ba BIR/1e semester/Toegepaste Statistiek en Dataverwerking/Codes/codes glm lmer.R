
##############################
#GLM
##############################

#tellingen => poisson model

aant <-c(1, 3, 7, 15, 26)
hoogte <-c(0, 100, 200, 300, 400)
lm1 <-glm(aant ~ hoogte, family = poisson)
lm1

#testen hypotheses

summary(lm1)
anova(lm1)
pchisq(40.415,1,lower.tail=F)

#de schatters

lm1$coefficients
lm1$fitted.values
lm1$linear.predictor

exp(lm1$linear.predictor)

plot(hoogte, aant)
lines(hoogte, lm1$fitted.values)

h <-seq(0, 400, 1)
fitted <-exp(lm1$coefficients[1]+ h*lm1$coefficients[2])
plot(hoogte, aant)
lines(h, fitted)

#voorspellingen: geven geen CI's

newh<-data.frame(hoogte=125)
predict(lm1,interval='confidence',new=newh,se=T)



#poisson ANCOVA
aant2 <-c(1, 3, 7, 15, 26, 33, 16, 8, 1, 2, 12, 20, 43, 75, 98)
hoogte2 <-c(0, 100, 200, 300, 400, 0, 100, 200, 300, 400, 0, 100, 200, 300, 400)
geb <-c(1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3)
geb <-as.factor(geb)

lm2 <-glm(aant2 ~ hoogte2+geb+hoogte2:geb, family = poisson)
summary(lm2)
anova(lm2)
pchisq(140.86,2,lower.tail=F)

plot(hoogte2,aant2,pch=as.integer(geb))
lines(hoogte2[geb==1],lm2$fitted.values[geb==1],lty=1)
lines(hoogte2[geb==2],lm2$fitted.values[geb==2],lty=2)
lines(hoogte2[geb==3],lm2$fitted.values[geb==3],lty=3)

#logistische modellen

aant <-c(1, 3, 2, 5, 6, 6, 7, 7, 9, 8, 10)
w <-c(10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10)
prop <-aant/w
hoogte <-c(0, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000)

lm3 <-glm(prop~hoogte,weights = w, family = binomial)


#testen hypotheses

summary(lm3)
anova(lm3)
pchisq(34.269,1,lower.tail=F)

#de schatters

lm3$coefficients
lm3$fitted.values
lm3$linear.predictor

exp(lm3$linear.predictor)/(1+exp(lm3$linear.predictor))


plot(hoogte, prop)
lines(hoogte, lm3$fitted.values)

h <-seq(0, 1200, 1)
fitted <-exp(lm3$coefficients[1]+ h*lm3$coefficients[2])/(1+exp(lm3$coefficients[1]+ h*lm3$coefficients[2]))
plot(hoogte, prop)
lines(h, fitted)


aant2 <-c(1, 3, 2, 5, 6, 6, 7, 7, 9, 8, 10, 4, 3, 2, 5, 3, 2, 1, 0, 1, 0, 0, 0, 4, 8, 9, 10, 9, 10, 10, 10, 10, 10)
w2 <-c(rep(10,33))
prop2 <-aant2/w2
hoogte2 <-c(0, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 0, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000,
0, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000)
geb <-as.factor(c(rep(1, 11), rep(2, 11), rep(3, 11)))
lm4 <-glm(prop2~hoogte2 + geb + hoogte2:geb, family = binomial,weight = w2)


#testen hypotheses

summary(lm4)
anova(lm4)

pchisq(81.241,2,lower.tail=F)


#simpsons paradox: effect van het negeren van een belangrijke verklarende

aant <-c(120, 23) #er loopt iets mis bij operatie
tot <-c(2200, 700)
prop <-aant/tot
ziekenh <-c('a','p')
glm1 <-glm(prop ~ ziekenh,weight = tot, family = binomial)
summary(glm1)


aant2 <-c(9, 111, 5, 18) #er loopt iets mis
tot2 <-c(1500, 700, 630, 70) #opsplitsen in niet zwaar vs wel
prop2 <-aant2/tot2
ziekenh2 <-c('a','a','p','p')
ernst <-c('n','j','n','j')

glm2 <-glm(prop2 ~ ziekenh2 + ernst + ziekenh2 : ernst, family = binomial,weight = tot2)
anova(glm2)
pchisq(0.271,1,lower.tail=F)

glm3 <-glm(prop2 ~ ziekenh2 + ernst, family = binomial,weight = tot2)
summary(glm3)

glm3$fitted.values



###########################################################
#RANDOM EFFECTS
###########################################################

#pseudoreplicatie?

growth<-matrix(data=NA,nrow=40,ncol=1)
tr<-matrix(data=NA,nrow=40,ncol=1)
effect_t<-matrix(data=NA,nrow=2,ncol=1)

i<-0
for(c in 1:2){
effect_c<-rnorm(1,mean=0,sd=0.5)
effect_t[c]<-0 #the effect of the actual treatment
for(j in 1:20){
i<-i+1
growth[i]<-10+effect_t[c]+effect_c+rnorm(1,0,0.1)
tr[i]<-c}}

#een one-way ANOVA

anova(lm(growth~as.factor(tr)))

#correct design: onafhankelijke herhalingen

growth<-matrix(data=NA,nrow=40,ncol=1)
tr<-matrix(data=NA,nrow=40,ncol=1)
ch<-matrix(data=NA,nrow=40,ncol=1)
effect_t<-matrix(data=NA,nrow=2,ncol=1)

i<-0
for(t in 1:2){
effect_t[1]<-0 
effect_t[2]<-0.5 #the effect of the actual treatment
for(c in 1:5){
effect_c<-rnorm(1,mean=0,sd=0.5) #an effect of climate room (random)
for(j in 1:4){
i<-i+1
growth[i]<-10+effect_t[t]+effect_c+rnorm(1,0,0.1)
tr[i]<-t
ch[i]<-c
}}}

#een ANOVA

anova(lm(growth~as.factor(tr)))

#correcte analyze:

tr<-as.factor(tr)
ch<-as.factor(ch)

lm0<-lm(growth~tr+ch:tr)
anova(lm0)
coef(lm0) 

#gebruik maximum likelihood
library(lme4)

lm1<-lmer(growth~tr+(1|ch:tr))
lm1

lm1b<-lmer(growth~1+(1|ch:tr))
anova(lm1,lm1b)


###############################################
#tweede voorbeeld
###############################################

#3 treatments and 2 rats per treatment
#of each liver 3 parts were used (left, central and right)
#each part cut in 2 => assess measurement error

r<-read.table('rats.txt',header=T)
attach(r)
names(r)

tr<-as.factor(Treatment)
rat<-as.factor(Rat)
l<-as.factor(Liver)

lm1<-lm(Glycogen~tr)
anova(lm1) #=> WRONG ... WHY?

library(lme4)

#correct solution: treatment and liver-part as fixed effect, rat nested within treatment as random

lm2<-lmer(Glycogen~tr+l+tr:l+(1+l|rat:tr))
lm2
lm2b<-lmer(Glycogen~tr+l+(1+l|rat:tr))
anova(lm2,lm2b)

#what if the random 'l' effect is ommitted?

lm2<-lmer(Glycogen~tr+l+tr:l+(1|rat:tr))
lm2
lm2b<-lmer(Glycogen~tr+l+(1|rat:tr))
anova(lm2,lm2b)


a <-read.table('split.txt', header = T)
attach(a)
library(lme4)
bedrijf <-as.factor(bedrijf)
voeding <-as.factor(voeding)
antib <-as.factor(antib)
lm1 <-lmer(groei ~ voeding + antib+ voeding : antib + (1 + voeding|bedrijf))


#random effects met GLMs

#poisson ANCOVA
aant2 <-c(1, 3, 7, 15, 26, 33, 16, 8, 1, 2, 12, 20, 43, 75, 98)
hoogte2 <-c(0, 100, 200, 300, 400, 0, 100, 200, 300, 400, 0, 100, 200, 300, 400)
geb <-c(1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3)
geb <-as.factor(geb)

glm1<-lmer(aant2~hoogte2+(1+hoogte2|geb))
glm1


