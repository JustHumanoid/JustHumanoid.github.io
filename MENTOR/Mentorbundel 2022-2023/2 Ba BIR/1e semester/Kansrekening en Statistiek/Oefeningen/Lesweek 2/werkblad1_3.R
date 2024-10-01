# oefening 3: Verdeling leeftijd

l<-read.table('verdelingleeftijd.txt',header=T)
l$X1950/sum(l$X1950)
l$X2075/sum(l$X2075)

x<- cbind(l$X1950/sum(l$X1950), l$X2075/sum(l$X2075))*100
rownames(x) <- l$Leeftijdsgroep
colnames(x) <- c(1950,2075)
x

barplot(l$X1950/sum(l$X1950),names.arg=l$Leeftijdsgroep)

barplot(l$X2075/sum(l$X2075),names.arg=l$Leeftijdsgroep)