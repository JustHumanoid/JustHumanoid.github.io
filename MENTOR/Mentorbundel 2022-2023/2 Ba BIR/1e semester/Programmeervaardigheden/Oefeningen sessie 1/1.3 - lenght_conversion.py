#inch = 2.54 cm
#foot = 12 inches
#yard = 3 feet
#mile = 1760 yards

M = input(" geef je waarde") # lengte in meter

Afstand=M*100 #lengte in cm
Inch = Afstand/2.54 # Bereknt het aantal inch
Foot = Inch/12 #berekent het aantal feet
Yard = Foot/3 #Berekent het aantal yard
Mile = Yard/1760 # Berekent het aantal mile

print "Inches =",Inch
print "Feet =",Foot
print "Yards =",Yard
print "Miles =",Mile

import time
time.sleep(3)
