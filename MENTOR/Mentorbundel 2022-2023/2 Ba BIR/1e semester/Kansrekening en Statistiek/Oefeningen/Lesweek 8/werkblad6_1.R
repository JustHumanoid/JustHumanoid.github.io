# oefening 1: Eiken

eik <- read.table('eiken.txt', header = T)
attach(eik)
X<-Gebied[Regio=='California']

mean(X) - qt(1-0.05/2,length(X)-1)*sd(X)/sqrt(length(X))
mean(X) + qt(1-0.05/2,length(X)-1)*sd(X)/sqrt(length(X))

mean(X) - qt(1-0.1/2,length(X)-1)*sd(X)/sqrt(length(X))
mean(X) + qt(1-0.1/2,length(X)-1)*sd(X)/sqrt(length(X))

(length(X)-1)*var(X)/qchisq(1-0.05/2,length(X)-1)
(length(X)-1)*var(X)/qchisq(0.05/2,length(X)-1)

(length(X)-1)*var(X)/qchisq(1-0.1/2,length(X)-1)
(length(X)-1)*var(X)/qchisq(0.1/2,length(X)-1)