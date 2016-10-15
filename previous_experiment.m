function [previous_experiment_result, x1_1_vector, x1_2_vector, x2_1_vector,x2_2_vector, y1_vector, y2_vector, delta_vector] = previous_experiment(a, b, c, d, fun)
    result = zeros(1, 500);

    u = 20;
    k = 1;
    
    x1_first = zeros(1, 500);
    x1_second = zeros(1, 500);
    
    x2_first = zeros(1, 500);
    x2_second = zeros(1, 500);
    
    y_first = zeros(1, 500);
    y_second = zeros(1, 500);
    
    deltas = zeros(1, 500);
    
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
            
            deltas(k) = delta;
            
            x1_first(k) = x1;
            x1_second(k) = x12;
        
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
            
            x2_first(k) = x2;
            x2_second(k) = x222;
            
            yk1 = -max(x1 * x2, 0)+ v1;
            yk2 = -max(x12 * x222, 0) + v2;
            
            y_first(k) = yk1;
            y_second(k) = yk2;
            
            u = max(10, u - (alpha / beta) * delta * (yk2 - yk1));
            
            result(k) = u;
        end
    end
    
    previous_experiment_result = result;
    x1_1_vector = x1_first;
    x1_2_vector = x1_second;
    
    x2_1_vector = x2_first;
    x2_2_vector = x2_second;
    
    delta_vector = deltas;
    
    y1_vector = y_first;
    y2_vector = y_second;
end