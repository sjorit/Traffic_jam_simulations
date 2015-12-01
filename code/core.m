function core()

    user_input;
    road = create_road(road_length, p_occupation, initial_obstacle);
    road = assign_v(road, v_min, v_max);
    
    hold on
    for j = 1:(0.05*number_iterations)
        r_plot_data = prepare_road_for_plot(road);
        plot((0:length(road)-1), r_plot_data*j, '. r')%',MarkerFaceColor', 'r', 'MarkerEdgeColor', 'w')
    end
    
    ylim([1, number_iterations])
    for i = (0.05*number_iterations):number_iterations
        road = update_traffic(road, v_unit, p_toddle_slow, p_toddle_fast, v_max, v_min, v_slow_fast_differenciation);
        r_plot_data = prepare_road_for_plot(road);
        if i > 100 
            road
        end
        plot((0:length(road)-1), r_plot_data*i, '. r')%',MarkerFaceColor', 'r', 'MarkerEdgeColor', 'w')
        %y=0 voll weil alle die möglichen ohne autos auf x achse geplottet
        %werden
    end
    
end