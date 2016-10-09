
clear;
evaluation_functional_1 = @(z1, z2)z1 * (z2);
a = 1000;
b = 3;
c = 8;
d = 0.5;

plot_result = previous_experiment(a, b, c, d, evaluation_functional_1);
plot(plot_result);

%{
plot_result = plot_function(a, b, c, d, evaluation_functional_1);
plot(plot_result);

first_experiment_vector = spsa_fun(a, b, c, d, evaluation_functional_1);
plot(first_experiment_vector, 'color', 'r'); hold on;


evaluation_functional_2 = @(z1, z2)z1 * (z2 - 2) + 2;
second_experiment_vector = spsa_fun(a, b, c, d, evaluation_functional_2);
plot(second_experiment_vector, 'color', 'b'); hold on;

evaluation_functional_3 = @(z1, z2)z1 * (z2 - 2) - 2;
second_experiment_vector = spsa_fun(a, b, c, d, evaluation_functional_3);
plot(second_experiment_vector, 'color', 'g');
%}