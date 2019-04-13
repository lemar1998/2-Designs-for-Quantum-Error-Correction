
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
fplot(a(7),[0 1]);
hold on
fplot(a(1),[0 1]);
hold on
fplot(b(1),[0 1]);
hold on
fplot(b(3),[0 1]);
legend('-(8*Pm^2 + 4*Pm + 9)/(48*Pm^2 + 24*Pm - 93)','Pq=1','Pm=0','Pm=1');
hold off