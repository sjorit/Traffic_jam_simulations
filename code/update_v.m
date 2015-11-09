function res = update_v(road, v_unit, p_toddle, v_max, v_min)
    res = road;
    for i = 1:length(res)
        %increase speed if possible by 1 (1 means here 1*v_unit)
        if (res(i) > 0 && res(i) < v_max) %if v < v_max -> v++
            if (res(i) < v_max - v_unit)
                res(i) = res(i) + v_unit;
            else
                res(i) = v_max;
            end
            
            d_to_front = dist_to_front(road, i);
            if res(i) >= d_to_front*v_unit %if velocity is higher than the distance to front car 
                                          %-> v = st. behind front car (freedom of collision)
                if d_to_front > 0 %remember: 1 is the label, that shows us, that a cell is still occupied 
                                  %(we don't want cars to dissappear)
                    res(i) = d_to_front*(v_unit); %todo - eventuell muss hier v_unit-1
                else
                    res(i) = 1;
                end
            end
            
        else %if there is already a car with v_max, check that it can continue at full speed without colliding
            if (res(i) > 1)
                d_to_front = dist_to_front(road, i);
                if res(i) >= d_to_front*v_unit
                    if d_to_front > 0
                        res(i) = d_to_front*(v_unit); %todo
                    else
                        res(i) = 1;
                    end
                end
            end
        end
  
        %toddle with probability p_toddle
        if (rand() < p_toddle) && (res(i) >= (v_unit))
            res(i) = res(i) - v_unit; 
            if res(i) == 0 %if the car is coming to a stop, we still wanna label the cell as occupied
                res(i) = 1;
            end
        end
    end
end