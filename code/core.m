function core()

%% initilize 
    user_input;
    road = create_road(road_length, p_occupation);
    road = assign_v(road, v_min, v_max);
    

%%    
    for i = 1:number_iterations
        road = update_traffic(road, v_unit, p_toddle, v_max, v_min);
        hold on
        r_plot_data = prepare_road_for_plot(road);
        plot((0:length(road)-1), r_plot_data*i, '. r')%',MarkerFaceColor', 'r', 'MarkerEdgeColor', 'w')
        ylim([1, number_iterations])
        %y=0 voll weil alle die möglichen ohne autos auf x achse geplottet
        %werden
    end
    
end