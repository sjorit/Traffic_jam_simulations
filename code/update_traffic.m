%this function is the core-update function and updates the traffic

function res = update_traffic(road, v_unit, p_toddle_slow, p_toddle_fast, v_max, v_min, v_slow_fast_differenciation)
    res = update_v(road, v_unit, p_toddle_slow, p_toddle_fast, v_max, v_min, v_slow_fast_differenciation);
    res = update_move(res, v_unit);        
end

