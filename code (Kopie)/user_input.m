%clear;

%rng(546);%5
p_occupation = 0.3;
initial_obstacle = false;
p_toddle_slow = 0.75;
p_toddle_fast = 1/64;%p_toddle_slow * 0.8;
road_length = 200;
v_max = 33; %maximum allowed velocity of a car
v_min = 0; %minimum initial velocity of a car
v_unit = 27/3.6; %m/s velocity unit (one cell of the road)
v_slow_fast_differenciation = 0.35 * v_max; %ca 100km/h bei v_max = 80 m/s
%number_iterations = 2000; %equivalent with time
safety_distance_time = 0;
dec_fac = 1; %decceleration factor -> toddling will reduce the velocity by dec_fac*v_unit