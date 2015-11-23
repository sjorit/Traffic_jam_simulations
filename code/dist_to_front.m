function dist = dist_to_front(road, position)
    dist = 1000000;
    for i = (position+1):(length(road)+position)
        if (i <= length(road))
            if road(i) > 0 
                dist = i - (position + 1);
                break
            end
        else
            j = i - length(road);
            if road(j) > 0 
                dist = length(road) + j - position - 1;% -pos -1 +j +i
                break
            end
        end
    end
    