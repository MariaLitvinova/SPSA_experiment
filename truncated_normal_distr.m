function truncated_normal_distr_number = truncated_normal_distr(z1, b, c, d, lower_bound, upper_bound)
    m = b - exp(z1 - c);
    %fprintf('%d %d\n', z1, m);
    s = d;
    
    X = trandn((lower_bound - m) / s, (upper_bound - m) / s);
    truncated_normal_distr_number = m + s * X;
end