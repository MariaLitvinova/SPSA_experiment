function emulated_exponential_distr_number = emulated_exp_distr(u, a)
    uniform_distribution = makedist('Uniform');
    lambda = a / u;
    emulated_exponential_distr_number = -log(random(uniform_distribution) / lambda);
    %emulated_exponential_distr_number = log(a / u);
end