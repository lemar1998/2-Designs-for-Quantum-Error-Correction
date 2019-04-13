
fs = 22050;
Pq = (0:(1/fs):0.1)';
Pm = (0:(1/fs):0.1)';
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
legend('-(8*Pm^5 - 12*Pm^4 - 6*Pm^3 + 11*Pm^2 + 3*Pm)/(48*Pm^5 - 72*Pm^4 - 36*Pm^3 + 66*Pm^2 + 18*Pm - 28)');
hold off
%Pq = (9*Pm)/28 is the approximate solution for the boundary