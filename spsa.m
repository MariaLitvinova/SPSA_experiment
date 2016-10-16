
clear;
evaluation_functional_1 = @(z1, z2)z1 * (z2 - 2);
a = 1000;
b = 3;
c = 8;
d = 0.5;


[plot_result, x] = previous_plot_function(a, b, c, d);
figure
plot(x, plot_result);

v1 = 0;
v2 = 2;
v3 = -2;

[experiment_result1, x11, x12, x21, x22, y1, y2, delta] = previous_experiment(a, b, c, v1);
T = table(delta.', x11.', x21.', y1.', x12.', x22.', y2.', experiment_result1.');
writetable(T, 'results_for_standart_noise.xls');
figure
plot(experiment_result1, 'color', 'r'); hold on;

[experiment_result2, x11, x12, x21, x22, y1, y2, delta] = previous_experiment(a, b, c, v2);
T = table(delta.', x11.', x21.', y1.', x12.', x22.', y2.', experiment_result2.');
writetable(T, 'results_for_positive_noise.xls');
plot(experiment_result2, 'color', 'g'); hold on;

[experiment_result3, x11, x12, x21, x22, y1, y2, delta] = previous_experiment(a, b, c, v3);
T = table(delta.', x11.', x21.', y1.', x12.', x22.', y2.', experiment_result3.');
writetable(T, 'results_for_negative_noise.xls');
plot(experiment_result3, 'color', 'b');
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