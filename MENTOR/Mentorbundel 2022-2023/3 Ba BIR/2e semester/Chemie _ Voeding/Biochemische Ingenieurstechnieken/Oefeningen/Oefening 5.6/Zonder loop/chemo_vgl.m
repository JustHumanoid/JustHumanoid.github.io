% Oefening 5.6
% chemo_vgl.m
function ydot=chemo_vgl(t,y)
S=y(1)
P=y(2)
X=y(3)
Ux=0.3
U=Ux*(S/(0.1+S))
Qx=U*X
Qs=Qx/0.8
Qp=(0.05+(0.1*U))*X
if t<=5
    D=0
else t>5
    D=0.25
end
dS=(D*(10-S))-(Qx/0.8)
dP=(-D*P)+((0.05+(0.1*U))*X)
dX=(-D*X)+(U*X)
ydot=[dS
    dP
    dX]
