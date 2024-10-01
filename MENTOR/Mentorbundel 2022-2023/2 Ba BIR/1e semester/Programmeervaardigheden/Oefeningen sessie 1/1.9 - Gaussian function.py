# f(x) = 1/(sqrt(2*pi) * s)** [-1/2 * ((x-m)/s)**2]

from math import pi, sqrt, exp

s = input ('Geef s')
x = input ('Geef x')
m = input ('Geef m')

f = 1/(sqrt(2*pi) * s)** (-1/2 * ((x-m)/s)**2)

print "f(x)=",f

import time
time.sleep(3)
