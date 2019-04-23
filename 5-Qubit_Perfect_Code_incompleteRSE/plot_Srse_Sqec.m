
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

plot(Pm,2*Pm/75,'--r');
hold on
Pm = sym('Pm','real');
Pq = sym('Pq','real');
Sqec = Sqec3times(Pm, Pq);
Srse = SrseOnce(Pm, Pq);
a=solve(Sqec==Srse,Pq);
b=solve(Sqec==Srse,Pm);

fplot(a(15),[0 1]);
legend('(2*Pm)/75','-(O(Pm^7) + 20*Pm^2 + 2*Pm)/(O(Pm^7) + 280*Pm^2 + 28*Pm - 75)');

hold off