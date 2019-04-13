function S = SrseOnce(Pm,Pq)
no_error = ((1-Pq).^3) * ((1-Pm).^3)';
nbflip_1_merror = ((1-Pq).^3) * (3*Pm.*(1-Pm).^2)';
bflip_no_merror = (3*Pq.*(1-Pq).^2) * ((1-Pm).^3)';
S = no_error + nbflip_1_merror + bflip_no_merror;