function S = SrseOnce_one(Pm,Pq)
no_error = ((1-Pq).^15) * ((1-Pm).^5)';
no_lerror_1_merror = ((1-Pq).^15) * (5*Pm.*(1-Pm).^4)';

lerror_no_merror = (15*Pq.*(1-Pq).^14) * ((1-Pm).^5)';


S = no_error + no_lerror_1_merror + lerror_no_merror;