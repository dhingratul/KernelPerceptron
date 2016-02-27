%% Initialization
clear all; close all; 
load data; load per index
count=0; per=0; temp=0;
[train, test, labeltr, labelte]=datapartition(fea, label,250000);
summation=0;
N1_max=2000%size(train,1);
alpha=zeros(N1_max,1);
mistakes=[]; iter=1;
y_hat=0;y_pred=0;
l=1; %Learning rate
for N1=2000:1000:N1_max
    alpha=zeros(N1,1);
    N2=abs(0.04*N1);
    %% Learning
for n=1:3
    tic;
    for j=1:N1
        for i=1:N1
        y_hat=y_hat+alpha(i,1)*labeltr(i,1)*gaussian_kernel(train(i,:),train(j,:));
        end
            if(sign(y_hat)~=labeltr(j))
               
            alpha(j)=alpha(j)+l*1;
            end
         y_hat=0;    
    end


%% Prediction
for j=1:N2
    for i=1:N1
        y_pred=y_pred+alpha(i,1)*labeltr(i)*gaussian_kernel(train(i,:),test(j,:));
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
per(iter,2)=toc;
per(iter,3)=count/N2*100
iter=iter+1;
count=0;
end
end
