function res = create_road(road_length, p_occupation)
    res = zeros(1,road_length);
    for i = 1:road_length
        op = rand();
        if op < p_occupation
            res(i) = 1;
        else
            res(i) = 0;
        end
    end
end