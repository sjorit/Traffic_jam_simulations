function res = create_road(road_length, p_occupation, initial_obstacle)
    res = zeros(1,road_length);
    for i = 1:road_length
        op = rand();
        if op < p_occupation
            res(i) = 1;
        else
            res(i) = 0;
        end
    end
    if (initial_obstacle == true)
        for i = floor(0.3 * length(res)):floor(0.4 * length(res))
            res(i) = 1;
        end
    end
end