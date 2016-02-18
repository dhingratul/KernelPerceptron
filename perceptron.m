%% Initialization
clear all; close all; clc;
load data;
fea=full(fea);
%% Reading the data from .svm file
% addpath('/home/dhingratul/Dropbox/Academics/Spring2016/CS-536/HW/HW2/Code/References/libsvm-3.21/matlab');
% [label, fea]=libsvmread('webspam_wc_normalized_unigram.svm');
%%
[train, test, labeltr, labelte]=datapartition(fea, label, 250000);
    
tic;
w=zeros(1,size(train,2)); % Each feature has a weight
b=0;
wb=1;
%% Learning
for i=1:size(train,1)

    if(labeltr(i,1)*(w*train(i,:)'+b)<=0)
        w=w+labeltr(i,1)*train(i,:);
        b=b+labeltr(i,1);
    end
end
    

