#A=(1+p/100)^n



n = input ("Geef het aantal jaar") #input van het aantal jaar
p = input ("Geef de interestvoet in in %")# input van de interestvoet
A = input ("Geef het startkapitaal") # input van het startkapitaal


Balans = A*(1.0+(p/100.0))**n # berekening van de uiteindelijke


print "Uiteindelijke balans",Balans

Winst= Balans-A

print "winst = ",Winst
import time
time.sleep(3)
