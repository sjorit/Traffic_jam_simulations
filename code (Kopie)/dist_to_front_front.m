function dist_front_front = dist_to_front_front(road, position)
    dist = dist_to_front(road, position);
    position_front_car = position + dist;
    dist_front_front = dist_to_front(road, position_front_car);
    
    end