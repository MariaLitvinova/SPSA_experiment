function [plot] = plot_function(a, b, c, d, fun)
    resulting_vector = zeros(1, 1000);
    
    for i = 1:1000
        %z1 = exp_distr(i, a);
        z1 = exp_distr_from_previous_experiment(i, a);
        
        %z2 = truncated_normal_distr(z1, b, c, d, 0, 5);
        z2 = normal_distr_from_previous_experiment(z1, b, c, d);
        
        y = fun(z1, z2);
        resulting_vector(i) = y;
    end
    
    plot = resulting_vector;
end

function [exp_distr_number] = exp_distr_from_previous_experiment(i, a)
    w = rand();
    exp_distr_number = round(-(a / i) * log(w));
end

function [normal_distr_number] = normal_distr_from_previous_experiment(z1, b, c, d)
    normal_distr_number = max(b - exp(z1 - c), 0);
end