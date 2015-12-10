

function [x] = create_road[road_length, occupation_p]
    x = zeros(1,road_length)
    for i = 1:road_length
        op = rand()
        if op < occupation_p
            x(i) = 1
        else
            x(i) = 0
        end
    end
end