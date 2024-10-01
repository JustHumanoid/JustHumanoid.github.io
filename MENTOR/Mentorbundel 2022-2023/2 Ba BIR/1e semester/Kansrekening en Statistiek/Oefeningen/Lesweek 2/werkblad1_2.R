# oefening 2: Overlevingsduur proefkonijnen

o<-read.table('overlevingsduurkonijnen.txt',header=T)
od<-o$overlevingsduur

hist(od) 

fiven<-fivenum(od) 
mean(od)
R<-fiven[5]-fiven[1]
Q<-fiven[4]-fiven[2]
var(od)
sd(od)
3*(mean(od)-median(od))/sd(od)

e1 <- fiven[2] - 3*Q
od<e1
sum(od<e1)
od[(od<e1)==T]

e2 <- fiven[4] + 3*Q
od>e2
sum(od>e2)
od[(od>e2)==T]

me1 <- fiven[2] - 1.5*Q
od<me1
sum(od<me1)
od[(od<me1)==T]

me2 <- fiven[4] + 1.5*Q
od>me2
sum(od>me2)
od[(od>me2)==T]