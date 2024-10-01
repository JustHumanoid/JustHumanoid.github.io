V<-c(0,1,2,3,4,5,6,7)
PV<-c(0.08,0.1,0.1,0.14,0.17,0.17,0.14,0.1)
sum(V*PV)


W<-matrix(data=NA,nrow=8,ncol=8)
for(i in 1:8){
for(j in 1:8){
v<-  i-1
g<-  j-1
if (v >= g) {W[j,i]<-g}
if (v < g) {W[j,i]<-2*v-g}
}}

W

PVgev<-NULL
for(n in 1:8) {PVgev[n] <- sum(PV[n:8])}
PVgev

FV<-NULL
for(n in 1:8) {FV[n] <- sum(PV[1:n])}
FV

plot(V,FV,type="s")