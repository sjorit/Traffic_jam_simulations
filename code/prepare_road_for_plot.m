function res = prepare_road_for_plot(road)
    res = road;
    for i = 1:length(road)
        if res(i) > 0
            res(i) = 1;
        end
    end
end
