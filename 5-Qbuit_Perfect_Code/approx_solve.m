%syms Pm Pq;
Pm = sym('Pm','real');
Pq = sym('Pq','real');
Sqec = Sqec3times(Pm, Pq);
Srse = SrseOnce(Pm, Pq);
a=solve(Sqec==Srse,Pq);
b=solve(Sqec==Srse,Pm);
c=solve(Pm==-(6*Pq - ((6*Pq + 1)*(192*Pq - 17))^(1/2) + 1)/(4*(6*Pq + 1)),Pq);
%{
ezplot(a(7),[0 1]);
hold on
ezplot(b(8),[0 1]);
hold on
%Pm = linspace(0,0.1,22050);
%plot(Pm,-(- 4*Pm.^3 + 4*Pm.^2 + 3*Pm)./(- 8*Pm.^3 + 8*Pm.^2 + 6*Pm - 9),'--r');
%plot(Pm,Pm/3,'--r');
%hold off


%expand(Sqec)
%expand(Srse)
%eqn = - 6*Pm^2 - 3*Pq^2 + 1 == - 3*Pm^2 - 9*Pm*Pq - 3*Pq^2 + 1
%solve(eqn,Pq)
eqn = - 12*Pm^2 - 105*Pq^2 + 1 == - 105*Pq^2 + 1
solve(eqn,Pq)
%}
Fqec = expand(1-Sqec);
Frse = expand(1-Srse);
file = fopen('polynomials.txt','w');
fprintf(file,'%s',Fqec);