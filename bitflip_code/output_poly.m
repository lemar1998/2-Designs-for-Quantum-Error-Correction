

p_m = sym('p_m','real');
p_q = sym('p_q','real');

S_QEC = Sqec3times(p_m, p_q);
S_DBR = SrseOnce(p_m, p_q);


F_QEC = expand(1-S_QEC);
F_DBR = expand(1-S_DBR);

%% this section limits the order of the polynomials to 8, using MuPAD function mtaylor
F_QEC = feval(symengine,'mtaylor',F_QEC, '[p_m, p_q]', 'AbsoluteOrder = 9');
F_DBR = feval(symengine,'mtaylor',F_DBR, '[p_m, p_q]', 'AbsoluteOrder = 9');

%% 

file = fopen('polynomials_Bitflip_Code.txt','w');
fprintf(file,'F_QEC = %s\n',F_QEC);
fprintf(file,'F_DBR = %s\n',F_DBR);

fclose(file);
