fs = 22050;
Pq = (0:(1/fs):1)';
Pm = (0:(1/fs):1)';
Srse = SrseOnce(Pm,Pq);
no_lerror_4_merror = ((1-Pq).^15) * (nchoosek(15,4)*Pm.*(1-Pm).^11)';
imagesc(Pm,Pq,Srse);
set(gca,'YDir','normal')
colorbar
%% try S14 = ZZXIX