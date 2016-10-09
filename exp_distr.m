function generated_exponential_distr_number = exp_distr(u, a)
    try
        exponential_distribution = makedist('Exponential', 'mu', a / u);
        generated_exponential_distr_number = random(exponential_distribution);
    catch ME
        generated_exponential_distr_number = 0;
    end
end
