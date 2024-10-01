# oefening 4: Hoeveelheid calorieën/natrium in hotdogs

h<-read.table('hotdogs.txt',header=T)
boxplot(h$Calorieën[h$Type=="RV"], h$Calorieën[h$Type=="V"], h$Calorieën[h$Type=="G"],ylab="calorieen",xlab="hotdog",names=c("rundvlees","vlees","gevogelte"))

fivenum(h$Calorieën[h$Type=="RV"])
fivenum(h$Calorieën[h$Type=="V"])
fivenum(h$Calorieën[h$Type=="G"])

stem(h$Calorieën[h$Type=="V"])
stem(h$Calorieën[h$Type=="V"],scale=2)

plot(h$Natrium[h$Type=="RV"],h$Calorieën[h$Type=="RV"],xlab="natriumgehalte",ylab="calorieen",main="rundvlees")

# analoog voor de andere types