//Skalare Parameter des System mit drei Freiheitsgraden
clear;
clc;
m1 = 1.0; m2 = 1.0; m3 = 1.0;
c1 = 100.0; c2 = 100.0; c0 = 100.0;
//Bilden der benoetigten Matrizen
Mm = [ m1 0 0; 0 m2 0; 0 0 m3 ];
Cm = [ c0+c1 -c1 0; -c1 c1+c2 -c2; 0 -c2 c2+c0 ];
Aq = inv(Mm)*Cm
//Eigenwerte und Eigenvektoren
[Phi,Ew] = spec(Aq)
//Schrittanzahl und -weite der graphischen Darstellung
kmax = 1000;
y = zeros (kmax,3);
t = zeros (kmax,1);
Ew1 = sqrt(Ew)
fmin = min(diag(abs(Ew1)))/(2.0*%pi);
dt = 3.0/(fmin*kmax);
//Anfangsbedingung und Amplituden der Eigenvektoren
x0 = [1.0; 2.0; 3.0];
a = linsolve(Phi,-x0)
//Schwingungsverhalten im Zeitbereich
for k=1:kmax
t(k) = dt*(k-1);
x = zeros(3);
for j=1:3
x = x + a(j)*Phi(:,j)*cos(Ew1(j,j)*t(k));
end
for j=1:3
y(k,j) = x(j);
end
end
//einfache graphische Darstellung
xset("window",1);
clf();
plot([t,t,t],y)
