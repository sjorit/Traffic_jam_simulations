function [res_tot, road, density_of_cars] = core(v_max)
    
    user_input;
    road = create_road(road_length, p_occupation, initial_obstacle);
    road = assign_v(road, v_min, v_max);
    flow_matrix_v = road;
    flow_abs_m = zeros(1, length(road));
    flow_delta_m = zeros(1, length(road));
    
    for i = (0.05*number_iterations):number_iterations
        [road, flow_delta_m] = update_traffic(road, v_unit, p_toddle_slow, p_toddle_fast, v_max, v_min, v_slow_fast_differenciation, safety_distance_time, dec_fac, flow_delta_m);
    end
    
    
    density_of_cars = sum(road > 0) / road_length;
    % @shin -> we got the flow per road configuration now in the
    % flow_delta_m
    % in flow_rate, you have the abs flow in moved cars per timestep
    flow_rate = zeros(1,length(flow_delta_m(:,1)));
    for j = 1:length(flow_rate)
        flow_rate(j) = sum(flow_delta_m(j,:)) / sum(road > 0);
    end
    flow_rate = flow_rate';
    res_tot = flow_rate;
    
    
end