function [generated_ss] = generate_ss(current_u, a, b, c)
     s = 0;
     ss = 0;
     
     x1 = zeros(1, 200);
     x2 = zeros(1, 200);

     for j = 1:10000
        w = rand();
        xx = -(a / current_u) * log(w);
        x1(j) = floor(xx);

        if (x1(j) > 0) 
            x2(j) = max(b - exp(x1(j) - c), 0);
            s = s + floor(x1(j));
            ss = ss + floor(x1(j) * x2(j));
        end
     end
     
     generated_ss = ss / 10000;
end