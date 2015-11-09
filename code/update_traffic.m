function res = update_traffic(road, v_unit, p_toddle, v_max, v_min)
    res = update_v(road, v_unit, p_toddle, v_max, v_min);
    res = update_move(res, v_unit);        
end

