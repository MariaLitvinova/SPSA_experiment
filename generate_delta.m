function generated_delta = generate_delta()
    r = rand();
    
    if r >= 0.5
        generated_delta = 1;
    else
        generated_delta = -1;
    end
end