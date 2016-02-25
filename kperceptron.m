%% Initialization
clear all; close all; clc;
load data; load per index
fea=full(fea);
count=0; per=0; temp=0;
[train, test, labeltr, labelte]=datapartition(fea, label, 250000);
summation=0;zeros(1,size(train,2)); % Each feature has a weight;
s=[]; iter=1;
N1=500;N2=100;
for N1=500:100:700
%% Learning
tic;
for j=1:10 % T=253 from last experiment
    for i=1:N1%length(labeltr)
        
        if(sign(summation)~=sign(labeltr(i,1)))
            s=[s;labeltr(i),train(i,:)];
            
            for k=1:size(s,1)
            summation=summation+s(k,1)*gaussian_kernel(s(k,2:end),train(i,:));
       
            end
        end
    end
end
time(iter,1)=toc
%% Prediction
for j=1:N2%size(test,1)
            for k=1:size(s,1)
            temp=temp+s(k,1)*gaussian_kernel(s(k,2:end),train(i,:));
            end
    if(sign(temp)>=0)
    outlabel(j,1)=1;
    else
    outlabel(j,1)=-1; 
    end
end
%% Accuracy
for i=1:N2%length(labelte)
    if(outlabel(i,1)==labelte(i,1))
        count=count+1;
    end
end
per(iter,1)=count/N2*100
iter=iter+1;
count=0;
end