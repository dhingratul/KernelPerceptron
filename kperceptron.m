%% Initialization
clear all; close all; 
load data; load per index
count=0; per=0; temp=0;
[train, test, labeltr, labelte]=datapartition(fea, label,250000);
summation=0;
N1_max=2000; % Number of data points from training set
alpha=zeros(N1_max,1); 
iter=1; y_hat=0;y_pred=0;
%%
for N1=2000:1000:N1_max
for sig=0.2:0.2:0.2
    alpha=zeros(N1,1);
    N2=abs(0.04*N1); %Number of data points from testing set
    %% Learning
for n=1:1 %Number of passes over the data
tic
    for j=1:N1
        for i=1:N1
        y_hat=y_hat+alpha(i,1)*labeltr(i,1)*gaussian_kernel(train(i,:),train(j,:),sig);
        end
            if(sign(y_hat)~=labeltr(j))
               
            alpha(j)=alpha(j)+1;
            end
         y_hat=0;    
    end
t=toc;

%% Prediction
for j=1:N2
    for i=1:N1
        y_pred=y_pred+alpha(i,1)*labeltr(i)*gaussian_kernel(train(i,:),test(j,:),sig);
    end
    if(sign(y_pred)>=0)
        outlabel(j,1)=1;
    else
        outlabel(j,1)=-1;
    end
    y_pred=0;
end     

%% Accuracy
A=(outlabel==labelte(1:N2));
count=sum(A(:));
per(iter,1)=N1;
if n==1
per(iter,2)=t;
else
per(iter,2)=sum(per(:,2))+t;
end
per(iter,3)=sig;
per(iter,4)=n;
per(iter,5)=count/N2*100
iter=iter+1;
count=0;
end
end
end