function S = gen_SrseOnce_full(v,k,lambda,Pm,Pq)

b = lambda*v*(v-1)/(k*(k-1));
r = lambda*(v-1)/(k-1);
distance = 2*(r - lambda);
max_tolerance_0 = floor(r / 2);
max_tolerance_1 = distance / 2 - 1;

rate_0_qubit_error = 0;

for i = 0:max_tolerance_0
    delta = ((1-Pq).^v) * (nchoosek(b,i)*Pm.^i.*(1-Pm).^(b-i))';
    rate_0_qubit_error = rate_0_qubit_error + delta;
end

rate_1_qubit_error = 0;

for i = 0:max_tolerance_1
    delta = (v*Pq.*(1-Pq).^(v-1)) * (nchoosek(b,i)*Pm.^i.*(1-Pm).^(b-i))';
    rate_1_qubit_error = rate_1_qubit_error + delta;
end


S = rate_0_qubit_error + rate_1_qubit_error;