clear;
label_list={};

user_input;
for v2 = 0:0%5
    x_data = [];
    y_data = [];
    %safety_distance_time = v2 / 5 * 3;
    v_max = 20 + v2*15
    v_max = 33;
    for v = 0:50
        %p_occupation = v / 100;
        number_iterations = v*20;
        %p_toddle_slow = v/100;
        %v_max = 20. + v*8;
        x_param = number_iterations;%p_occupation;
        [res_tot, road, density_of_cars] = core(x_param, v_max);
        hold on
        x_data = [x_data, x_param];
        %x_data = [x_data, density_of_cars];
        
        y_data = [y_data, res_tot];
        %plot(linspace(0, length(res_tot), length(res_tot)), res_tot) %label = xparam
        
    end
    label_list = [label_list, num2str(v_max)];
    plot(x_data, y_data)
end



ylim([0,1])
xlim([0,1000])
ylabel('average flow rate in veh/time','FontSize',20)
xlabel('time step','FontSize',20)
%label_list = strcat('safety time delta = ', label_list, ' s');
label_list = strcat('v_{max} = ', label_list, ' m/s')
%legend(label_list)
