function [previous_experiment_result] = previous_experiment(a, b, c, d, fun)
    result = zeros(1, 100);

    u = 20;
    k = 1;
    
    while k <= 100
        delta = generate_delta();
        
        beta = 5;
        alpha = 1;
        
        v1 = 2 * (rand() - 0.5);
        v2 = 2 * (rand() - 0.5);
        
        v1 = -2;
        v2 = -2;
        
        b_uu = max(u + beta * delta, 10);
        
        x1 = round(-(a / u) * log(rand()));
        x12 = round(-(a / b_uu) * log(rand()));
        
        if (x1 > 0) || (x12 > 0)
            k = k + 1;
        
            if (x1 > 0)
                x2 = max(b - exp(x1 - c), -200);
            else
                x2 = 0;
            end
            
            if (x12 > 0)
                x222 = max(b - exp(x12 - c), -200);
            else
                x222 = 0;
            end
            
            yk1 = max(x1 * x2, -200) + v1;
            yk2 = max(x12 * x222, -200) + v2;
            
            u = max(10, u + (alpha / beta) * delta * (yk2 - yk1));
            
            result(k) = u;
        end    
    end
    
    previous_experiment_result = result;
end