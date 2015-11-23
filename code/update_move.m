function res = update_move(road, v_unit)
    res = road;
    res_lookup = road;
    %now move all the cars according to their velocities
    l = length(road);
    for j = 0:(length(road)-1)
        i = l - j;
        lui = floor(res_lookup(i) / v_unit); %look up index
        
        if (res_lookup(i) > 1) && (i + lui <= length(road)) %if occupied and posi-
            %tion + travelling distance < road length
            res(i + lui) = res_lookup(i); %move car to index according position
            if lui > 0 %if there was a car, which we moved,
                res(i) = 0; %free the cell %todo: is the v=1 always when a car stands still or cannot move a complete cell?
            end
        elseif (res_lookup(i) > 1) && (lui + i > length(road)) %if the car drops out at the end of the road
            res(i + lui - length(road)) = res_lookup(i);
            if lui > 0
                res(i) = 0;
            end
        end
    end
end
