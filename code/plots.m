function [] = plots(density,  flow)
%PLOTTING THE FUNDAMENTAL DIAGRAM
% plots flow vs. density for different maximum velocities

% INPUTS:
% density: K*L matrix containing density vectors of size K for L different models
% flow:  K*L matrix containing density vectors of size K for L different models
% *note: maximum velocity must be equal for all models

% OUTPUTS: none, this function only plots figures
gg
% CODE
figure(1)
plot(flow(1),density(1),'r',flow(2),density(2),'g',...
    flow(3),density(3),'b',flow(4),density(4),'k--')
title('The Fundamental Diagram for different Models')
xlabel('\rho')
ylabel('j')
axis([0 1 0 1])
legend('NaSch','VDR','Anticipatory','VDR + Anticipatory')

end

