# oefening 2: Bevolking

pol <- read.table('pollutiedataset.txt', header = T)
attach(pol)

mean(Mortality) - qnorm(1-0.05/2)*sqrt(3845)/sqrt(length(Mortality))
mean(Mortality) + qnorm(1-0.05/2)*sqrt(3845)/sqrt(length(Mortality))

2*qnorm(1-0.05/2)*sqrt(3845)/sqrt(length(Mortality))

qnorm(1-0.05/2)^2*3845/100

mean(Mortality) - qt(1-0.05/2,length(Mortality)-1)*sd(Mortality)/sqrt(length(Mortality))
mean(Mortality) + qt(1-0.05/2,length(Mortality)-1)*sd(Mortality)/sqrt(length(Mortality))