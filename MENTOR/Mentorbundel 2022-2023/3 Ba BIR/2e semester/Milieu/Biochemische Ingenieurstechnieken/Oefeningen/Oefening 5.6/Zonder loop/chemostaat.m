% Oefening 5.6
% chemostaat.m
% Begincondities
y0=[10 0 1]
% Duur
tspan=[0 60]
% Solver oproepen
[t y]=ode45(@chemo_vgl,tspan,y0)
% Grafiek
plot(t,y(:,1),'s-',t,y(:,2),'+-',t,y(:,3),':')
xlabel('duur(h)')
ylabel('concentratie(kmol/m^3)')
legend('A','B','C')
