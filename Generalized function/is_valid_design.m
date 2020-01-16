function ret=is_valid_design(v,k,lambda)
    ret = true;
    b = lambda*v*(v-1)/(k*(k-1)); % with v>=k,it is certain that b>=lambda
    r = lambda*(v-1)/(k-1);       % with v>=k,it is certain that r>=lambda
                                  % also with v>=k,it is certain that b>=r
    if (v <= 0) || (k <= 0) || (lambda < 0)
        ret = false;
    elseif v < k
        ret = false;
    elseif nchoosek(v,k) < b
        ret = false;
    elseif mod(k,2) ~= 0
        ret = false;
    elseif mod(lambda,2) ~= 0
        ret = false;
    elseif mod(b,1) ~= 0
        ret = false;
    elseif mod(r,1) ~= 0
        ret = false;
    end
end