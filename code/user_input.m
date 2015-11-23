clear;

p_occupation = 0.2;
initial_obstacle = false;
p_toddle_slow = 0.2;
p_toddle_fast = p_toddle_slow * 1;
road_length = 200;
v_max = 200; %maximum allowed velocity of a car
v_min = 60; %minimum initial velocity of a car
v_unit = 27; %velocity unit (one cell of the road)
v_slow_fast_differenciation = 0.4 * v_max;
number_iterations = 300; %equivalent with time