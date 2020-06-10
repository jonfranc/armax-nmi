% This code is for mutual information calculation
close all
clear
clc
%%
load zonetemp
%load roomtemp_testing
%load occupancy_testing2
% Normalization
zonetemp_training = zonetemp(1:10000,:);
x1 = zonetemp_training(:,1); % Temperature
x1_nor = (x1-min(x1)*ones(size(x1,1),1))*(1/(max(x1)-min(x1)));
x2 = zonetemp_training(:,2); % CFM
x2_nor = (x2-min(x2)*ones(size(x2,1),1))*(1/(max(x2)-min(x2)));
x3 = zonetemp_training(:,3); % DAT
x3_nor = (x3-min(x3)*ones(size(x3,1),1))*(1/(max(x3)-min(x3)));
x4 = zonetemp_training(:,4); % RAT
x4_nor = (x4-min(x4)*ones(size(x4,1),1))*(1/(max(x4)-min(x4)));
x5 = zonetemp_training(:,5); % OAT
x5_nor = (x5-min(x5)*ones(size(x5,1),1))*(1/(max(x5)-min(x5)));
x6 = zonetemp_training(:,6); % Static_P
x6_nor = (x6-min(x6)*ones(size(x6,1),1))*(1/(max(x6)-min(x6)));
% x7 = zonetemp_training(:,7); % South
% x7_nor = (x7-min(x7)*ones(size(x7,1),1))*(1/(max(x7)-min(x7)));
% x8 = zonetemp_training(:,8); % OutsideTemp
% x8_nor = (x8-min(x8)*ones(size(x8,1),1))*(1/(max(x8)-min(x8)));
% x9 = roomtemp_training(:,9); % Sun
% x9_nor = (x9-min(x9)*ones(size(x9,1),1))*(1/(max(x9)-min(x9)));
M = zeros(size(zonetemp_training,2),size(zonetemp_training,2));
zonetemp_training_nor = [x1_nor,x2_nor,x3_nor,x4_nor,x5_nor,x6_nor];
% partitioning (Uniform partitioning)
zonetemp_training_p = zeros(size(zonetemp_training,1),size(zonetemp_training,2));
p = [0.2,0.4,0.6,0.8];
for k = 1:size(zonetemp_training_nor,1)
    for z = 1:size(zonetemp_training_nor,2)
        if zonetemp_training_nor(k,z)<=p(1)
            zonetemp_training_p(k,z)=1;
        elseif zonetemp_training_nor(k,z)>p(1) && zonetemp_training_nor(k,z)<=p(2)
            zonetemp_training_p(k,z)=2;
        elseif zonetemp_training_nor(k,z)>p(2) && zonetemp_training_nor(k,z)<=p(3)
            zonetemp_training_p(k,z)=3;
        elseif zonetemp_training_nor(k,z)>p(3) && zonetemp_training_nor(k,z)<=p(4)
            zonetemp_training_p(k,z)=4;
        else
            zonetemp_training_p(k,z)=5;
        end
    end
end
for i = 1:size(zonetemp_training,2)
    for j = 1:size(zonetemp_training,2)
        estimate = nmi(zonetemp_training_p(:,i)',zonetemp_training_p(:,j)');
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
