%{
syms pq pm;
Sqec = (1-pq)^3*(1-pm)^6 + 3*pq*(1-pq)^2*(1-pm)^6 + 9*pq*(1-pq)^2*pm*(1-pm)^5
%}
%{
Sqec = Sqec3times(0.554, 0.1356);
Srse = SrseOnce(0.554, 0.1356)
Sqec-Srse
%}
%{
fs = 22050;
Pq = (0:(1/fs):1)';
Pm = (0:(1/fs):1)';
Diff = zeros(fs,fs);
for i = 1:numel(Pm)
    for j = 1:numel(Pq)
        Sqec = Sqec3times(Pm(i),Pq(j));
        Srse = SrseOnce(Pm(i),Pq(j));
        Diff(i,j) = Sqec - Srse;
    end
end

%{
Sqec = Sqec3times(Pm,Pq);
Srse = SrseOnce(Pm,Pq);
Diff  = Srse - Sqec;
%}
imagesc(Pm,Pq,Diff);
%axis Pm Pq;
set(gca,'YDir','normal')
colorbar
%}
I = eye(3);
Equal = I==0;
subplot(2,1,1);
image([1:3],[1:3],I);
colorbar
subplot(2,1,2);
image(1:3,1:3,Equal);
colorbar