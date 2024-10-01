from math import pi

h = input('Geef de lengte van hoogte') # Hoogte
b = input('Geef de legte van de basis') # Basis
r = input ('Geef de lengte van de straal') # straal

oppervlakte_parrallellogram = h*b
print 'Oppervlakte parrallellogram = %.3f' % oppervlakte_parrallellogram

oppervlakte_vierkant = b**2
print'Oppervlakte vierkant = %g' % oppervlakte_vierkant

oppervlakte_cirkel = pi*r**2
print'Oppervlakte cirkel = %8.3f' % oppervlakte_cirkel

volume_kegel = 1.0/3*pi*r**2*h
print'Volume kegel = %.3f' % volume_kegel

import time
time.sleep(3)
