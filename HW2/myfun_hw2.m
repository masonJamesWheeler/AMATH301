function f = myfun_hw2(x)
    if x < -1
        f = x + 1;
    elseif x < 0
        f = x^2;
    elseif x < 1
        f = x - 2;
    else
        f = x^2 + 1;
    end
end