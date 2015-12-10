
function res = assign_v(road, v_min, v_max)
    res = road;
    v_std = 10; %standard deviation and mean of initial velocity distribution
    v_mean = 30;
    r_n = v_std.*randn(length(road),1) + v_mean; %vector with the initial v distr.
                                    %mean at 30m/s and std of 10 m/s
    for i = 1:length(road)
        if res(i) ==  1
            res(i) = v_min + r_n(i);
        end
    end
end

% function res = assign_v(road, v_min, v_max)
%     res = road;
%     for i = 1:length(road)
%         if res(i) ==  1
%             res(i) = v_min + rand()*(v_max-v_min);
%         end
%     end
% end