fs = 22050;
Pq = (0:(1/fs):1)';
Pm = (0:(1/fs):1)';
syms Pq Pm real
S_gen_VQbit = gen_SrseOnce_full(15,8,4,Pm,Pq);
S_spc_VQbit = VQbit_SrseOnce_full(Pm,Pq);
S_gen_steane = gen_SrseOnce_full(7,4,2,Pm,Pq);
S_spc_steane = steane_SrseOnce_full(Pm,Pq);
isequal(S_gen_VQbit,S_spc_VQbit)
isequal(S_gen_steane,S_spc_steane)