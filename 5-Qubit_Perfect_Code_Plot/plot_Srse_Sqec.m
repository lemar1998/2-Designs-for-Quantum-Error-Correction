
fs = 22050;
Pq = (0:(1/fs):1)';
Pm = (0:(1/fs):1)';
Sqec = Sqec3times(Pm,Pq);
Srse_full = SrseOnce_full(Pm,Pq);
Srse_one = SrseOnce_one(Pm,Pq);
Diff_full  = Srse_full - Sqec;
Diff_one  = Srse_one - Sqec;

ax1 = subplot(1,2,1);
imagesc(Pm,Pq,Diff_one);
set(gca,'YDir','normal')
caxis([-0.02 0.2]);
colorbar
xlabel('p_m');
ylabel('p_q');
title('Minimal Redundant Extraction (MR)');
hold on
plot(Pm,2*Pm/75,'--r');
hold on
Pm = sym('Pm','real');
Pq = sym('Pq','real');
Sqec = Sqec3times(Pm, Pq);
Srse_full = SrseOnce_full(Pm, Pq);
Srse_one = SrseOnce_one(Pm,Pq);
a=solve(Sqec==Srse_one,Pq);
b=solve(Sqec==Srse_full,Pq);
fplot(a(15),[0 1]);
hold off
pbaspect(ax1, [1 1 1]);
Pq = (0:(1/fs):1)';
Pm = (0:(1/fs):1)';
ax2 = subplot(1,2,2);

imagesc(Pm,Pq,Diff_full);
set(gca,'YDir','normal')
caxis([-0.02 0.2]);
colorbar
xlabel('p_m');
ylabel('p_q');
title('Design-Based Redundancy (DBR)');
hold on
fplot(b(15),[0 1]);
hold off
pbaspect(ax2, [1 1 1]);
%{
used script from:
https://www.mathworks.com/matlabcentral/answers/93972-how-can-i-prin
t-a-figure-to-pdf-in-landscape-with-the-right-scaling-in-matlab-7-3-r2006b
%}
h=gcf;
set(h,'PaperPositionMode','auto');         
set(h,'PaperOrientation','landscape');
set(h,'Position',[50 50 1200 800]);
print(gcf, '-dpdf', '5_Qubit_Perfect_Code_full_range.pdf')