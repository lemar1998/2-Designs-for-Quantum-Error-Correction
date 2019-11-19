function S = steane_SrseOnce_full(Pm,Pq)
no_error = ((1-Pq).^7) * ((1-Pm).^7)';
nbflip_1_merror = ((1-Pq).^7) * (7*Pm.*(1-Pm).^6)';
nbflip_2_merror = ((1-Pq).^7) * (21*(Pm.^2).*(1-Pm).^5)';
bflip_no_merror = (7*Pq.*(1-Pq).^6) * ((1-Pm).^7)';
bflip_1_merror = (7*Pq.*(1-Pq).^6) * (7*Pm.*(1-Pm).^6)';
S = no_error + nbflip_1_merror + nbflip_2_merror + bflip_no_merror + bflip_1_merror;