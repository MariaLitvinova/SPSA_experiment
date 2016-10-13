function [previous_experiment_result] = previous_experiment(a, b, c, d, fun)
    result = zeros(1, 500);

    u = 20;
    k = 1;
    
    while k <= 500
        delta = generate_delta();
        
        beta = 10;
        alpha = 3;
        
        v1 = 0;%2 * (rand() - 0.5);
        v2 = 0;%2 * (rand() - 0.5);
        
        %v1 = -2;
        %v2 = -2;
        
        b_uu = max(u + beta * delta, 10);
        
        x1 = floor(-(a / u) * log(rand()));
        x12 = floor(-(a / b_uu) * log(rand()));
        
        if ((x1 > 0) && (x12 > 0))
            k = k + 1;
        
            if (x1 > 0)
                x2 = max(b - exp(x1 - c), 0);
            else
                x2 = 0;
            end
            
            if (x12 > 0)
                x222 = max(b - exp(x12 - c), 0);
            else
                x222 = 0;
            end
            
            yk1 = -max(x1 * x2, 0)+ v1;
            yk2 = -max(x12 * x222, 0) + v2;
            
            u = max(10, u - (alpha / beta) * delta * (yk2 - yk1));
            
            result(k) = u;
        end
    end
    
    previous_experiment_result = result;
end