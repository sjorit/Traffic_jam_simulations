function res = assign_v(road, v_min, v_max)
    res = road;
    for i = 1:length(road)
        if res(i) ==  1
            res(i) = v_min + rand()*(v_max-v_min);
        end
    end
end