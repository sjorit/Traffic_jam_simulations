function dist = dist_to_front(road, position)
    dist = 100;
    for i = (position+1):length(road)
        if road(i) > 0 
            dist = i - (position + 1);
            break
        end
    end
    