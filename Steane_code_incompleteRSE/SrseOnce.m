function S = SrseOnce(Pm,Pq)
no_error = ((1-Pq).^7) * ((1-Pm).^4)';
nbflip_1_merror = ((1-Pq).^7) * (4*Pm.*((1-Pm).^3))';
bflip_no_merror = (7*Pq.*(1-Pq).^6) * ((1-Pm).^4)';

S = no_error + nbflip_1_merror + bflip_no_merror;