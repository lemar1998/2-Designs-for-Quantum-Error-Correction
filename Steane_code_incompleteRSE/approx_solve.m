
Pm = sym('Pm','real');
Pq = sym('Pq','real');
Sqec = Sqec3times(Pm, Pq);
Srse = SrseOnce(Pm, Pq);



%expand(Sqec)
%expand(Srse)

eqn = - 9*Pm^2- 21*Pq^2 + 1 == - 6*Pm^2 - 28*Pm*Pq- 21*Pq^2 + 1;
solve(eqn,Pq)