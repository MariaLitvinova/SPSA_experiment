function [previous_experiment_result, x1_1_vector, x1_2_vector, x2_1_vector,x2_2_vector, y1_vector, y2_vector, delta_vector] = previous_experiment(a, b, c, v)
    number_of_iterations = 90;
    
    u = 20;
    k = 1;
    
    result = zeros(1, number_of_iterations);
    
    x1_first = zeros(1, number_of_iterations);
    x1_second = zeros(1, number_of_iterations);
    
    x2_first = zeros(1, number_of_iterations);
    x2_second = zeros(1, number_of_iterations);
    
    y_first = zeros(1, number_of_iterations);
    y_second = zeros(1, number_of_iterations);
    
    deltas = zeros(1, number_of_iterations);
    
    while k <= number_of_iterations
        delta = generate_delta();
        
        beta = 10;
        alpha = 2;
        
        b_uu = max(u + beta * delta, 10);
        
        x1 = floor(-(a / u) * log(rand()));
        x12 = floor(-(a / b_uu) * log(rand()));
        
        if ((x1 > 0) && (x12 > 0))
            k = k + 1;
            
            if v == 0 
                v_real = 2 * (rand() - 0.5);
            else
                v_real = v;
            end
            
            deltas(k) = delta;
            
            x1_first(k) = x1;
            x1_second(k) = x12;
        
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
            
            x2_first(k) = x2;
            x2_second(k) = x222;
            
            yk1 = -max(x1 * x2, -200)+ v_real;
            yk2 = -max(x12 * x222, -200) + v_real;
            
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