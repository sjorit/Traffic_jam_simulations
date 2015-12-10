%this function is the core-update function and updates the traffic

function [res, flow_delta_m, end_road_flow_count] = update_traffic(road, v_unit, p_toddle_slow, p_toddle_fast, v_max, v_min, v_slow_fast_differenciation, safety_distance_time, dec_fac, flow_delta_m)
    res = update_v(road, v_unit, p_toddle_slow, p_toddle_fast, v_max, v_min, v_slow_fast_differenciation, safety_distance_time, dec_fac);
    [res, flow_delta_m, end_road_flow_count] = update_move(res, v_unit, flow_delta_m);        
end

