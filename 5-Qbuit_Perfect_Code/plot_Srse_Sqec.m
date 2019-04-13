
fs = 22050;
Pq = (0:(1/fs):1)';
Pm = (0:(1/fs):1)';
Sqec = Sqec3times(Pm,Pq);
Srse = SrseOnce(Pm,Pq);
Diff  = Srse - Sqec;

imagesc(Pm,Pq,Diff);
set(gca,'YDir','normal')
colorbar
hold on


Pm = sym('Pm','real');
Pq = sym('Pq','real');
Sqec = Sqec3times(Pm, Pq);
Srse = SrseOnce(Pm, Pq);
a=solve(Sqec==Srse,Pq);
b=solve(Sqec==Srse,Pm);

fplot(a(15),[0 1]);
legend('-(- 1001*Pm^5 + 2717*Pm^4 - 2211*Pm^3 + 314*Pm^2 + 88*Pm + 12)/(6461*Pm^5 - 23387*Pm^4 + 30471*Pm^3 - 16079*Pm^2 + 1232*Pm + 168)');

hold off