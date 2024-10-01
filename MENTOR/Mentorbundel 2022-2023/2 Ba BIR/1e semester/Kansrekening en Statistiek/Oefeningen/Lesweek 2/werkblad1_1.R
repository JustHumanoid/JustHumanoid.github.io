# oefening 1: Gemiddelde januari temperatuur USA

temperatuur <- c(0,1,8,9,9,11,11,12,13,13,14,14,15,18,20,20,21,21,21,21,22,22,22,23,24,24,24,24,25,26,26,27,27,27,28,30,31,31,31,32,33,33,34,35,38,39,39,42,44,44,45,48,49,57,65)

plot(sort(temperatuur),(1:55)/55,xlab="temperatuur",ylab="F(temperatuur)",type="s")

median(temperatuur)

sum(temperatuur < 14)/length(temperatuur)

breedtegraad <- c(52,49,50,44,42,41,47,45,44,49,45,45,49,41,44,45,41,43,38,38,42,44,49,39,41,40,35,39,35,42,37,40,38,40,37,40, 40,43,37,31,35,41,33,38,35,39,28,32,29,41,34,35,25,24,23)

plot(temperatuur,breedtegraad,xlab="temperatuur",ylab="breedtegraad")

cor(temperatuur, breedtegraad)