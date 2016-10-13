function [previous_experiment_result, x] = previous_plot_function(a, b, c, d)
    current_u = 0;
    
    result = zeros(1, 200);
    x = zeros(1, 200);
    
    for i = 1:200
        current_u = current_u + 5;
        x(i) = current_u;
        
        ss_average = generate_ss(current_u, a, b, c);
        
        result(i) = ss_average;
    end
    
    previous_experiment_result = result;
end