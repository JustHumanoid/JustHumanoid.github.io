ratten<-read.table('rats.txt',header=T)
attach(ratten)
ratten
lm1<-lm(Gain~Protein+Amount+Protein:Amount)
anova(lm1)

t.test(Gain[Amount=='Low']~Protein[Amount=='Low'])

t.test(Gain[Amount=='High']~Protein[Amount=='High'])

t.test(Gain[Protein=='Beef']~Amount[Protein=='Beef'])

t.test(Gain[Protein=='Cereal']~Amount[Protein=='Cereal'])