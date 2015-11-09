function res = update_move(road, v_unit)
    res = road;
    %now move all the cars according to their velocities
    l = length(road);
    for j = 0:(length(road)-1)
        i = l - j;
        lui = floor(res(i) / v_unit);
        
        if (res(i) > 1) && (i + lui <= length(road))
            res(i + lui) = res(i); %todo
            if lui > 0
                res(i) = 0; %free the cell
            end
        elseif (res(i) > 1) && (lui + i > length(road))
            res(i) = 0;
        end
    end
end
