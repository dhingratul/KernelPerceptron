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
w=zeros(2,size(train,2)); % Each feature has a weight
b=0;
wb=1;
correct=0;
ctr=1;
for i=1:size(train,1)%100
    for j=1:(size(w,1))
%% Learning
    z(j,1)=w(j,:)*train(i,:)';
    end
    [maximum, index] = max(z(:)); %Calculating argmax
%% Weight Updates
    if index~=labeltr(i,1)+1
    w(labeltr(i,1)+1,:)=w(labeltr(i,1)+1,:)+train(i,:);
    w(index,:)=w(index,:)-train(i,:);
    end
  
% end
% w=(w-min(w(:)))/(max(w(:))-min(w(:))); %Normalization of weight vector
% save Weights w
end
 
time(ctr,1)=toc;

time(ctr,1)=toc;
%% Classification
for i=1:size(test,1)%100
    for j=1:(size(w,1))

   z(j,1)=w(j,:)*test(i,:)';
    end
   [maximum, index] = max(z(:)); %Calculating argmax
    if index==labelte(i,1)+1
      correct=correct+1;
    end
    
end
Percentage(ctr,1)=correct/length(labelte)*100;
ctr=ctr+1;
