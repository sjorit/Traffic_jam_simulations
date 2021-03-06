    clear;
    user_input;
    road = create_road(road_length, p_occupation, initial_obstacle);
    road = assign_v(road, v_min, v_max);
    flow_matrix_v = road;
    flow_abs_m = zeros(1, length(road));
    flow_delta_m = zeros(1, length(road));
    
    hold on
    for j = 1:(0.05*number_iterations)
        r_plot_data = prepare_road_for_plot(road);
        plot((0:length(road)-1), r_plot_data*j, '. r')%',MarkerFaceColor', 'r', 'MarkerEdgeColor', 'w')
        1;
    end
    
    ylim([1, number_iterations])
    for i = (0.05*number_iterations):number_iterations
        [road, flow_delta_m] = update_traffic(road, v_unit, p_toddle_slow, p_toddle_fast, v_max, v_min, v_slow_fast_differenciation, safety_distance_time, dec_fac, flow_delta_m);
        flow_abs_m = cat(1, flow_abs_m, road == flow_matrix_v(end, :)); %oldest flow-change on top -> if we have flow -> means the state of the 
                                %cell changed, we label this with "1" %todo
                                %-change whenever a car leaves and appears
                                %and no change if a car arrives with same
                                %velocity in a cell where one left
        flow_matrix_v = cat(1,flow_matrix_v, road); %oldest configuration on top
        r_plot_data = prepare_road_for_plot(road);
        plot((0:length(road)-1), r_plot_data*i, '. r')%',MarkerFaceColor', 'r', 'MarkerEdgeColor', 'w')
        %y=0 voll weil alle die möglichen ohne autos auf x achse geplottet
        %werden
    end
    
    
    density_of_cars = sum(road > 0) / road_length;
    % @shin -> we got the flow per road configuration now in the
    % flow_delta_m
    % in flow_rate, you have the abs flow in moved cars per timestep
    flow_rate = zeros(1,length(flow_delta_m(:,1)));
    for j = 1:length(flow_rate)
        flow_rate(j) = sum(flow_delta_m(j,:));
    end
    flow_rate = flow_rate';
    res_tot = flow_rate;
    ylabel('time','FontSize',20)
    xlabel('road configuration','FontSize',20)

