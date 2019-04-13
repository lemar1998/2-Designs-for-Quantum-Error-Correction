function S = Sqec1time(Pm,Pq)
no_error = ((1-Pq).^7) * ((1-Pm).^3)';
bflip_no_merror = (7*Pq.*(1-Pq).^6) * ((1-Pm).^3)';
S= no_error + bflip_no_merror;