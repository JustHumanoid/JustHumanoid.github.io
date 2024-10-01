# oefening 2: Metaalzaagmachines
# verwachte kost
0.3*6^2+16*6 + 0.3*20^2+16*20
T <- 0:24
EC <- 16*T + 0.3*T^2
plot(T,EC)

# oefening 3: Assemblagelijn
dbinom(2,2,0.12)
dbinom(5,20,0.12)

# oefening 4: Basketbalspeler
1-pbinom(4,12,0.25)
12*0.25

# oefening 5: Overboekingen
n <- 201:214
P <- 1-pbinom(200,n,0.95)
P