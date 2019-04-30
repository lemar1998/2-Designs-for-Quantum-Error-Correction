
fs = 22050;
Pq = (0:(1/fs):0.01)';
Pm = (0:(1/fs):0.01)';
Sqec = Sqec3times(Pm,Pq);
Srse = SrseOnce(Pm,Pq);
Diff  = Srse - Sqec;

imagesc(Pm,Pq,Diff);
set(gca,'YDir','normal')
caxis([-7e-3 2e-3]);
colorbar
xlabel('Pm');
ylabel('Pq');
title('5-Qubit Perfect Code (Full Stabilizer Group)');
hold on


Pm = sym('Pm','real');
Pq = sym('Pq','real');
Sqec = Sqec3times(Pm, Pq);
Srse = SrseOnce(Pm, Pq);
a=solve(Sqec==Srse,Pq);
b=solve(Sqec==Srse,Pm);

fplot(a(15),[0 1]);
legend('Fqec = Frse');

hold off