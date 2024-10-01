# Fd = 1/2 * Cd * q * A * V**2

from math import exp, pi

q = input ('Geef de dichtheid van lucht in meter kg/m^3 ')
V = input ('Geef de snelheid van het object in m/s^2 ')
A = input ('Geef de dwarse oppervlakte van het object in m^2')
Cd = input ('Geef de luchtwrijvingscoëfficient ')
m = input ('Geef de massa van het object in kg ')
g = 9.81

Fg = m*g
Fd = (1.0/2)*Cd*q*A*V**2

print 'De zwaartekracht op het voorwerp bedraagt: ',Fg,'N'
print 'De luchtwrijving op het voorwerp bedraagt: ',Fd,'N'

import time
time.sleep(3)
