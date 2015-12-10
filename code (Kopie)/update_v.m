 function res = update_v(road, v_unit, p_toddle_slow, p_toddle_fast, v_max, v_min, v_slow_fast_differenciation, safety_distance_time, dec_fac)
    res = road;
    for i = 1:length(res)
        acc_fac = 1;
        %increase speed if possible by 1 (1 means here 1*v_unit)
        if (res(i) > 0 && res(i) < v_max) %if v < v_max -> v++
            if (res(i) < v_max - acc_fac * v_unit)
                res(i) = res(i) + acc_fac * v_unit;
            else
                res(i) = v_max;
            end
            
            d_to_front = dist_to_front(road, i); 
            if res(i) >= (d_to_front - res(i)*safety_distance_time/v_unit)*v_unit && res(i) > 10 %if velocity is higher than the distance to front car 
                                           %-> v = st. behind front car
                                           %(freedom of collision) AND
                                           %isn't in a jam yet
                if (d_to_front - res(i)*safety_distance_time/v_unit) > 0 %remember: 1 is the label, that shows us, that a cell is still occupied 
                                  %(we don't want cars to dissappear)
                    res(i) = (d_to_front - res(i)*safety_distance_time/v_unit)*(v_unit); %todo - eventuell muss hier v_unit-1
                else
                    res(i) = 1;
                end            
            
            elseif res(i) >= (d_to_front)*v_unit %if velocity is higher than the distance to front car 
                                           %-> v = st. behind front car
                                           %(freedom of collision) 
                if (d_to_front) > 0 %remember: 1 is the label, that shows us, that a cell is still occupied 
                                  %(we don't want cars to dissappear)
                    res(i) = (d_to_front)*v_unit; %todo - eventuell muss hier v_unit-1
                else
                    res(i) = 1;
                end
            end
            
            
        else %if there is already a car with v_max, check that it can continue at full speed without colliding
            if (res(i) > 1)
                d_to_front = dist_to_front(road, i);
                if res(i) >= (d_to_front - res(i)*safety_distance_time/v_unit)*v_unit
                    if (d_to_front - res(i)*safety_distance_time/v_unit) > 0
                        res(i) = (d_to_front - res(i)*safety_distance_time/v_unit)*(v_unit); %todo
                    else
                        res(i) = 1;
                    end
                end
            end
        end
  
        %toddle with probability p_toddle_slow/fast, depending on if the
        %driver is slow or fast defined in the usre input
        if (res(i) <= v_slow_fast_differenciation)
            if (rand() < p_toddle_slow) && (res(i) > 0)
                res(i) = res(i) - dec_fac*v_unit; 
                if (res(i) <= 0) %if the car is coming to a stop, we still wanna label the cell as occupied
                    res(i) = 1;
                end
            end
        else
            if (rand() < p_toddle_fast) && (res(i) > 0)
                res(i) = res(i) - dec_fac*v_unit; 
                if (res(i) <= 0) %if the car is coming to a stop, we still wanna label the cell as occupied
                    res(i) = 1;
                end
            end
        end
    end
end