% This code is for mutual information calculation
close all
clear
clc
%%
load data_CMU_06_18
occupancy_training = data_CMU_06_18(1:1500,:);
% Normalization
x1 = occupancy_training(:,1); % Temperature
x1_nor = (x1-min(x1)*ones(size(x1,1),1))*(1/(max(x1)-min(x1)));
x2 = occupancy_training(:,2); % Humidity
x2_nor = (x2-min(x2)*ones(size(x2,1),1))*(1/(max(x2)-min(x2)));
x3 = occupancy_training(:,3); % Light
x3_nor = (x3-min(x3)*ones(size(x3,1),1))*(1/(max(x3)-min(x3)));
x4 = occupancy_training(:,4); % CO2
x4_nor = (x4-min(x4)*ones(size(x4,1),1))*(1/(max(x4)-min(x4)));
x5 = occupancy_training(:,5); % HumidityRatio
x5_nor = (x5-min(x5)*ones(size(x5,1),1))*(1/(max(x5)-min(x5)));
% x6 = occupancy_training(:,6); % Occupancy
M = zeros(size(occupancy_training,2),size(occupancy_training,2));
occupancy_training_nor = [x1_nor,x2_nor,x3_nor,x4_nor,x5_nor];
% partitioning (Uniform partitioning)
occupancy_training_p = zeros(size(occupancy_training,1),size(occupancy_training,2));
p = [0.2,0.4,0.6,0.8];
for k = 1:size(occupancy_training_nor,1)
    for z = 1:size(occupancy_training_nor,2)
        if occupancy_training_nor(k,z)<=p(1)
            occupancy_training_p(k,z)=1;
        elseif occupancy_training_nor(k,z)>p(1) && occupancy_training_nor(k,z)<=p(2)
            occupancy_training_p(k,z)=2;
        elseif occupancy_training_nor(k,z)>p(2) && occupancy_training_nor(k,z)<=p(3)
            occupancy_training_p(k,z)=3;
        elseif occupancy_training_nor(k,z)>p(3) && occupancy_training_nor(k,z)<=p(4)
            occupancy_training_p(k,z)=4;
        else
            occupancy_training_p(k,z)=5;
        end
    end
end
for i = 1:size(occupancy_training,2)
    for j = 1:size(occupancy_training,2)
        estimate = nmi(occupancy_training_p(:,i)',occupancy_training_p(:,j)');
        %[estimate,Nbias,sigma,descriptor] = information(occupancy_training_p(:,i)',occupancy_training_p(:,j)');
        M(i,j) = estimate;
        if i == j
            M(i,j) = 0;
        end
        if M(i,j)<0
            M(i,j) = 0;
        end
    end
end
