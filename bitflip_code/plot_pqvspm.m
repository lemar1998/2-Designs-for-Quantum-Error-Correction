
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
title('Bitflip Code');
hold on

%{
boundary = abs(Diff) <= 10e-6;
imagesc(Pm,Pq,boundary);
set(gca,'YDir','normal')
colorbar
colormap(flipud(gray));
xlabel('Pm');
ylabel('Pq');
title('abs(Srse-Sqec)<=10e-6');
hold on
%}
plot(Pm,Pm/3,'--r');
hold on
Pm = sym('Pm','real');
Pq = sym('Pq','real');
Sqec = Sqec3times(Pm, Pq);
Srse = SrseOnce(Pm, Pq);
a=solve(Sqec==Srse,Pq);

fplot(a(3),[0 1]);
legend('Pm/3','Fqec = Frse');

hold off