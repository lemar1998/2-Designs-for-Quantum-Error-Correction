function S = VQbit_SrseOnce_full(Pm,Pq)
no_error = ((1-Pq).^15) * ((1-Pm).^15)';
no_lerror_1_merror = ((1-Pq).^15) * (15*Pm.*(1-Pm).^14)';
no_lerror_2_merror = ((1-Pq).^15) * (nchoosek(15,2)*Pm.^2.*(1-Pm).^13)';
no_lerror_3_merror = ((1-Pq).^15) * (nchoosek(15,3)*Pm.^3.*(1-Pm).^12)';
no_lerror_4_merror = ((1-Pq).^15) * (nchoosek(15,4)*Pm.^4.*(1-Pm).^11)';

lerror_no_merror = (15*Pq.*(1-Pq).^14) * ((1-Pm).^15)';
lerror_1_merror = (15*Pq.*(1-Pq).^14) * (15*Pm.*(1-Pm).^14)';
lerror_2_merror = (15*Pq.*(1-Pq).^14) * (nchoosek(15,2)*Pm.^2.*(1-Pm).^13)';
lerror_3_merror = (15*Pq.*(1-Pq).^14) * (nchoosek(15,3)*Pm.^3.*(1-Pm).^12)';

S = no_error + no_lerror_1_merror + no_lerror_2_merror + no_lerror_3_merror + no_lerror_4_merror + lerror_no_merror + lerror_1_merror + lerror_2_merror + lerror_3_merror;