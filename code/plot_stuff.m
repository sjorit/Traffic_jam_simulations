clear;
for v = 0:100
    p_toddle_slow = v/100;
    x_param = p_toddle_slow;
    [res_tot, road, density_of_cars] = core(x_param);
    hold on
    %plot(linspace(0,length(res_tot)-1,length(res_tot)),res_tot, '. r')
    plot(x_param, sum(res_tot)/length(res_tot), '. r')
end
   
%ylim([0.1,0.7])
%xlim([0,1])
ylabel('average flow rate')
xlabel('probability of toddling of slow cars')