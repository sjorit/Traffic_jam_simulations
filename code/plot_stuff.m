for v = 0:100
    v_max = 16 + 100/100*v;
    [res_tot, road, density_of_cars] = core(v_max);
    hold on
    %plot(linspace(0,length(res_tot)-1,length(res_tot)),res_tot, '. r')
    plot(v_max, sum(res_tot)/length(res_tot), '. r')
end
   
ylim([0.1,0.7])
xlim([16,100])
ylabel('flow rate')
xlabel('v_{max} in m/s')