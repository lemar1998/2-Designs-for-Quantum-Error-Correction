
fs = 22050;
Pq = (0:(1/fs):1)';
Pm = (0:(1/fs):1)';
n_i = 1;
n_f = 4;
[v,k,lambda] = generate_biplane_params(2*[n_i:n_f]);
n = n_f - n_i + 1;
for i = 1:numel(lambda)
    ax = subplot(ceil(n/3),3,i);
    if is_valid_design(v(i),k(i),lambda(i))
        Srse_full = gen_SrseOnce_full(v(i),k(i),lambda(i),Pm,Pq);
        imagesc(Pm,Pq,Srse_full);
        set(gca,'YDir','normal')
        caxis([0 1]);
        colorbar
        xlabel('p_m');
        ylabel('p_q');
        str = sprintf('Order %d biplane',2*(i-1+n_i));
        title(str);
        pbaspect(ax, [1 1 1]);
    end
end

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