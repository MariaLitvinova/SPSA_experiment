function [previous_experiment_result] = previous_plot_function(a, b, c, d)
    current_u = 0;
    
    result = zeros(1, 100);
    x1 = zeros(1, 100);
    x2 = zeros(1, 100);
    
    for i = 1:100
        current_u = current_u + 5;
        
        s = 0;
        ss = 0;
        
        for j = 1:100
            w = rand();
            xx = -(a / current_u) * log(w);
            x1(j) = round(xx);
            
            if (x1(j) > 0) 
                x2(j) = max(b - exp(x1(j) - c), 0);
                s = s + round(x1(j));
                ss = ss + round(x1(j) * x2(j));
            end
        end
        
        s = s / 100;
        
        result(i) = ss;
    end
    
    previous_experiment_result = result;
end