function [resulting_vector] = spsa_fun(a, b, c, d, fun)
    initial_u = 20;
    alpha = 1;
    beta = 5;
    
    vector = zeros(1, 200);
    vector(1) = initial_u;
    
    for n = 2:200
        current_value = next_eval(alpha, beta, vector(n - 1), fun, a, b, c, d);
        vector(n) = current_value;
        fprintf('%d %d %d\n', n, vector(n - 1), vector(n));
    end
    
    resulting_vector = vector;
end

function next_evaluation = next_eval(alpha, beta, u_prev, fun, a, b, c, d)
    delta = generate_delta();
    
    u_minus = u_prev - beta * delta;
    z1_minus = exp_distr(u_minus, a);
    z2_minus = truncated_normal_distr(z1_minus, b, c, d, 0, 5);
    y_minus = fun(z1_minus, z2_minus);
    
    u_plus = u_prev + beta * delta;
    z1_plus = exp_distr(u_plus, a);
    z2_plus = truncated_normal_distr(z1_plus, b, c, d, 0, 5);
    y_plus = fun(z1_plus, z2_plus);
    
    quasigradient = delta * (y_plus - y_minus) / (2 * beta);
    
    next_evaluation = u_prev - alpha * quasigradient;
end