function S = gen_SrseOnce_full(v,k,lambda,Pm,Pq)

b = lambda*v*(v-1)/(k*(k-1));
r = lambda*(v-1)/(k-1);

% the distance between the syndrome of no error (all 0) and any error is 
% r, and thus results in the tolerance below
max_tolerance_0 = floor(r / 2);

distance = 2*(r - lambda);          % by definition
max_tolerance_1 = distance / 2 - 1;

rate_0_qubit_error = 0;

% summing over all events of 0 qubit error within tolerance
for i = 0:max_tolerance_0
    delta = ((1-Pq).^v) * (nchoosek(b,i)*Pm.^i.*(1-Pm).^(b-i))';
    rate_0_qubit_error = rate_0_qubit_error + delta;
end

rate_1_qubit_error = 0;

% summing over all events of 1 qubit error within tolerance
for i = 0:max_tolerance_1
    delta = (v*Pq.*(1-Pq).^(v-1)) * (nchoosek(b,i)*Pm.^i.*(1-Pm).^(b-i))';
    rate_1_qubit_error = rate_1_qubit_error + delta;
end

S = rate_0_qubit_error + rate_1_qubit_error;