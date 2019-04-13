function S = Sqec3times(Pm,Pq)
no_error = ((1-Pq).^3) * ((1-Pm).^6)';
bflip_no_merror = (3*Pq.*(1-Pq).^2) * ((1-Pm).^6)';
bflip_1_merror = (3*Pq.*(1-Pq).^2) * (6*Pm.*(1-Pm).^5)';
nbflip_1_merror = ((1-Pq).^3) * (6*Pm.*(1-Pm).^5)';
bflip_2_merror = (3*Pq.*(1-Pq).^2) * (9*Pm.^2.*(1-Pm).^4)';
nbflip_2_merror = ((1-Pq).^3) * (9*Pm.^2.*(1-Pm).^4)';
S = no_error + bflip_no_merror + bflip_1_merror + nbflip_1_merror + bflip_2_merror + nbflip_2_merror;