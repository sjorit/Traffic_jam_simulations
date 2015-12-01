clear;

p_occupation = 0.4;
initial_obstacle = false;
p_toddle_slow = 0.5;
p_toddle_fast = p_toddle_slow * 1;
road_length = 200;
v_max = 80; %maximum allowed velocity of a car
v_min = 20; %minimum initial velocity of a car
v_unit = 27/3.6; %m/s velocity unit (one cell of the road)
v_slow_fast_differenciation = 0.4 * v_max;
number_iterations = 300; %equivalent with time