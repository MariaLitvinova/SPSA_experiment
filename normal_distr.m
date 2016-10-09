function generated_normal_distr_number = normal_distr(z1, b, c, d, lower_bound, upper_bound)
    try    
        normal_distribution = makedist('Normal', 'mu', b - exp(z1 - c), 'sigma', d);
        truncated_normal_distribution = truncate(normal_distribution, lower_bound, upper_bound);
        generated_normal_distr_number = random(truncated_normal_distribution);
    catch ME
        generated_normal_distr_number = 0;
    end
end