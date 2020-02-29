function [v,k,lambda] = generate_biplane_params(n)
    lambda = n./n.*2;
    k = n + 2;
    v = 1 + (n+2).*(n+1)./2;
end
