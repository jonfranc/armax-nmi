% This code is for model estimation using ARMAX
clear
close all
clc
%%
load data_CMU_06_08
% spit the data into training and testing
occupancy_training = data_CMU_06_08(1:1500,:);
occupancy_testing = data_CMU_06_08(1501:2310,:);
N = 2; % Index of independent variable
% y here means output and u means different inputs
% y1 for training and y2 for testing
y1 = occupancy_training(:,1);
u1 = occupancy_training(:,N);
u1_1 = occupancy_training(:,3);
u1_2 = occupancy_training(:,4);
u1_3 = occupancy_training(:,5);

y2 = occupancy_testing(:,1);
u2 = occupancy_testing(:,N);
u2_1 = occupancy_testing(:,3);
u2_2 = occupancy_testing(:,4);
u2_3 = occupancy_testing(:,5);
% Convert the data into iddata first
data_training = iddata(y1,[u1 u1_3],1);
% data_testing = iddata(y2,u2,1);
data_testing = iddata(y2,[u2 u2_3],1);
% data_testing2 = iddata(y3,[u3,u3_1,u3_2],1);

% Call the armax function in MATLAB: na is the number of poles, nb is the
% number of zeros plus 1, nc is the number of C coefficients, nk is the
% number of input samples that occur the input affects the output
% please see the link with more details
% https://www.mathworks.com/help/ident/ref/armax.html#btey4su
th3 = armax(data_training,'na',3,'nb',[3 1],'nc',1,'nk',[1 1]);

% State-space model
% ms = n4sid(data_training, 6, 'InputDelay',1);
% ms1 = n4sid(data_training, 6, 'InputDelay',1);
% ms2 = n4sid(data_training, 15, 'InputDelay',1);
% ms3 = n4sid(data_training, 30, 'InputDelay',1);
% Regularized ARMAX and regularized ARX
% opt = armaxOptions;
% opt.Regularization.Lambda = 1;
% regu_armax_4 = armax(data_training, 'na',4,'nb',[4 4 4],'nc',4,'nk',[1 1 1],opt);
% regu_armax_2 = armax(data_training, 'na',4,'nb',[2 2 2],'nc',2,'nk',[1 1 1],opt);
% obtaining a lower-order armax model by converting a regularized arx model
% followed by order reduction
% opt1 = arxOptions;
% [L,R] = arxRegul(data_training, 'na',4,'nb',[4 4 4],'nk',[1 1 1]);
% opt1.Regularization.Lambda = L;
% opt1.Regularization.R = R;
% m0 = arx(data_training,'na',4,'nb',[4 4 4],'nk',[1 1 1]);
% m1 = arx(data_training,'na',10,'nb',[10 10 10],'nk',[1 1 1]);
% m2 = arx(data_training,'na',30,'nb',[30 30 30],'nk',[1 1 1]);
%mr = idpoly(balred(idss(m0),7));
%opt2 = compareOptions('InitialCondition','z');
% compare(data_testing,th4,regu_armax_4,m0,m1,m2,ms)
% Compare the predictions and real values
compare(data_testing,th3)