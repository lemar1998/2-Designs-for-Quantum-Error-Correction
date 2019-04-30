
fs = 22050;
Pq = (0:(1/fs):0.01)';
Pm = (0:(1/fs):0.01)';
Sqec = Sqec3times(Pm,Pq);
Srse = SrseOnce(Pm,Pq);
Diff  = Srse - Sqec;

imagesc(Pm,Pq,Diff);
set(gca,'YDir','normal')
caxis([-28e-4 9e-4]);
colorbar
xlabel('Pm');
ylabel('Pq');
title('Steane Code (One Extra Stabilizer)');
hold on

plot(Pm,3*Pm/28,'--r');
hold on
Pm = sym('Pm','real');
Pq = sym('Pq','real');
Sqec = Sqec3times(Pm, Pq);
Srse = SrseOnce(Pm, Pq);
a=solve(Sqec==Srse,Pq);
b=solve(Sqec==Srse,Pm);

fplot(a(7),[0 1]);
legend('(3*Pm)/28','Fqec = Frse');

hold off
