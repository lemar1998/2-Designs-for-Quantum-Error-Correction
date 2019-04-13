%syms Pm Pq;
Pm = sym('Pm','real');
Pq = sym('Pq','real');
Sqec = Sqec3times(Pm, Pq);
Srse = SrseOnce(Pm, Pq);
%{
a=solve(Sqec==Srse,Pq);
ezplot(a(3),[0 0.1]);
hold on

Pm = linspace(0,0.1,22050);
%plot(Pm,-(- 4*Pm.^3 + 4*Pm.^2 + 3*Pm)./(- 8*Pm.^3 + 8*Pm.^2 + 6*Pm - 9),'--r');
plot(Pm,Pm/3,'--r');
hold off
%}

expand(Sqec)
expand(Srse)
%eqn = - 6*Pm^2 - 3*Pq^2 + 1 == - 3*Pm^2 - 9*Pm*Pq - 3*Pq^2 + 1
%solve(eqn,Pq)
