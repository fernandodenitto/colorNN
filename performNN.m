function [regress,mse] = performNN(nn_input, target, train_fun,  hiddenLayerSize)
% Solve an Input-Output Fitting problem with a Neural Network
% Script generated by Neural Fitting app
% Created 17-May-2018 19:27:52
%
% This script assumes these variables are defined:
%
%   nn_input - input data
%   target - target data.

x = nn_input;
t = target;
trainFcn = train_fun;
% Choose a Training Function
% For a list of all training functions type: help nntrain
% 'trainlm' is usually fastest.
% 'trainbr' takes longer but may be better for challenging problems.
% 'trainscg' uses less memory. Suitable in low memory situations.
%

% Create a Fitting Network
%hiddenLayerSize = 10;
net = fitnet(hiddenLayerSize,trainFcn);
%net.trainParam.max_fail = 10;
% Setup Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

% Train the Network
[net,tr] = train(net,x,t);

% Test the Network
y = net(x);
mse = perform(net,t,y)
regress= regression(t,y)


% View the Network
%view(net)

% Plots
% Uncomment these lines to enable various plots.
%figure, plotperform(tr)
%figure, plottrainstate(tr)
%figure, ploterrhist(e)
%figure, plotregression(t,y)
%figure, plotfit(net,x,t)
