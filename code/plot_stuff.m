clear;
label_list={};
x_data = [];
y_data = [];
for v = 0:100
    %p_occupation = v / 100;
    p_toddle_slow = v/100;
    %v_max = 20. + v;
    x_param = p_toddle_slow;
    [res_tot, road, density_of_cars] = core(x_param);
    hold on
    x_data = [x_data, x_param];
    %x_data = [x_data, density_of_cars];
    y_data = [y_data, mean(res_tot)];
    %plot(linspace(0, length(res_tot), length(res_tot)), res_tot/length(res_tot)) %label = xparam
    %label_list = [label_list, num2str(v_max)];
end

plot(x_data, y_data, '-x')

ylim([0,1])
xlim([0,1])
ylabel('average flow rate')
xlabel('probability of toddling for slow cars')
label_list = strcat('v_{max} = ', label_list, ' m/s');
%legend(label_list)
