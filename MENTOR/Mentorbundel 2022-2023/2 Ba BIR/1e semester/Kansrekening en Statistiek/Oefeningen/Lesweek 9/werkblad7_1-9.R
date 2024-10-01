# oefening 1

pol <- read.table('pollutiedataset.txt', header=T)
attach(pol)

950 - qt(1-0.05, length(Mortality)-1)*sd(Mortality)/sqrt(length(Mortality))
mean(Mortality)

(mean(Mortality)-950)/(sd(Mortality)/sqrt(length(Mortality)))
-qt(1-0.05, length(Mortality)-1)

pt((mean(Mortality)-950)/(sd(Mortality)/sqrt(length(Mortality))), length(Mortality)-1)
0.05

t.test(Mortality, mu = 950, alternative='less')

# oefening 2

1-pt((936.5771-930)/(sd(Mortality)/sqrt(length(Mortality))), length(Mortality)-1)

# oefening 3

qqnorm(Mortality)
shapiro.test(Mortality)

qqnorm(NOxPot)
shapiro.test(NOxPot)

# oefening 4

sum(NOxPot<15)
1-pbinom(37,60,0.5)


# oefening 5

o5 <- c(102,25,28,5)
e5 <- c(90,30,30,10)
sum((o5-e5)^2/e5)
qchisq(1-0.05,3)
1-pchisq(sum((o5-e5)^2/e5),3)


# oefening 6

x <- c(38.5,41.5,40.0,42.2,37.8)
shapiro.test(x)
chi6 <- 4*var(x)
qchisq(0.05/2,4)
qchisq(1-0.05/2,4)
2*(1-pchisq(chi6,4))

# oefening 7

z7 <- (17/50-1/2)/sqrt(1/2*1/2*1/50)
2*(1-pnorm(abs(z7)))

# oefening 8

x8 <- 0:9
o8 <- c(18,53,103,107,82,46,18,10,2,1)
lambda <- sum(x8*o8)/sum(o8)
pX <- dpois(x8[1:9],lambda)
pX[10] <- 1- ppois(8,lambda)
e8 <- sum(o8)*pX
chi<-sum((o8-e8)^2/e8)
qchisq(1-0.05,8)
1-pchisq(chi,8)

# oefening 9

pchisq(32,16)-pchisq(8,16)