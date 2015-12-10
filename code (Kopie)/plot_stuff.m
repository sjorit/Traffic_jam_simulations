clear;
label_list={};
x_data = [];
y_data = [];
user_input;
for v = 0:300
    
    number_iterations = v*1.6;
    
    number_iterations
    %p_occupation = v / 200;
    %p_toddle_slow = v/100;
    %v_max = 20. + v*8;
    x_param = number_iterations;
    [res_tot, road, density_of_cars] = core(x_param);
    hold on
    x_data = [x_data, x_param];
    %x_data = [x_data, density_of_cars];
    y_data = [y_data, res_tot];
    %plot(linspace(0, length(res_tot), length(res_tot)), res_tot) %label = xparam
    %label_list = [label_list, num2str(v_max)];
end

plot(x_data, y_data, 'x')

ylim([0,0.5])
xlim([0,5000])
ylabel('average flow rate')
xlabel('number of iterations')
label_list = strcat('v_{max} = ', label_list, ' m/s');
%legend(label_list)
