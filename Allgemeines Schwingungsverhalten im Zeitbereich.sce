//Skalare Parameter des System mit drei Freiheitsgraden
clear;
m1 = 1.0; m2 = 4.0; m3 = 1.0;
c1 = 100.0; c2 = 200.0; c0 = 100.0;
d1 = 2.0; d2 = 1.0; d0 = 1.0;
//Bilden der benoetigten Matrizen
Mm = [ m1 0 0; 0 m2 0; 0 0 m3 ];
Cm = [ c0+c1 -c1 0; -c1 c1+c2 -c2; 0 -c2 c2+c0 ];
Dm = [ d0+d1 -d1 0; -d1 d1+d2 -d2; 0 -d2 d2+d0 ];
A = [ zeros(3,3) eye(3,3); -inv(Mm)*Cm -inv(Mm)*Dm ]
//Eigenwerte und Eigenvektoren
[Phi,Ew] = spec(A)
//Anfangswerte zur Berechnung der modalen Amplituden
q0 = [1; 1; 1; 0; 0; 0];
a = linsolve (Phi,-q0)
//Loesung im Zeitbereich
kmax = 1000;
dt = 0.005;
for k=1:kmax
qs = zeros (6);
t (k) = (k-1)*dt;
for j=1:6
qs = qs + a(j)*Phi(:,j)*exp(Ew(j,j)*t(k));
end
for j=1:3
x (k,j) = qs (j);
xp(k,j) = qs (j+3);
end
end
xset("window",1);
clf();
plot([t,t,t],x)
xset("window",2);
clf();
plot([t,t,t],xp)
