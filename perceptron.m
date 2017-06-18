%% Perceptron Algorithm
% function[per,time]=perceptron(T)
%% Initialization
load data;
count=0; per=0;
% % % Reading the data from .svm file
% % addpath('/home/dhingratul/Dropbox/Academics/Spring2016/CS-536/HW/HW2/Code/References/libsvm-3.21/matlab');
% % [label, fea]=libsvmread('webspam_wc_normalized_unigram.svm');
%%
[train, test, labeltr, labelte]=datapartition(fea, label, 250000);
N1=5000;%size(train,1);
N2=abs(0.04*N1);
train=train(1:N1,:);
test=test(1:N2,:);
labeltr=labeltr(1:N1);
labelte=labelte(1:N2);
%%
w=zeros(1,size(train,2)); % Each feature has a weight
b=0; output=[];
wb=1; idx=1;
for l=0.1:0.1:0.1 %Learnig Rate
    tic;
    %% Learning
    for T=1:1000 % Number of iterations to convergence
        
        for i=1:size(train,1)
            
            if(labeltr(i,1)*(w*train(i,:)'+b)<=0)
                w=w+l*(labeltr(i,1)*train(i,:));
                b=b+labeltr(i,1);
            end
        end
        t=toc;
        %% Classification
        for i=1:size(test,1)
            if(w*(test(i,:))'+b>=0)
                outlabel(i,1)=1;
            else
                outlabel(i,1)=-1;
            end
        end
        %% Accuracy
        for i=1:length(labelte)
            if(outlabel(i,1)==labelte(i,1))
                count=count+1;
            end
        end
        per(T,2)=count/length(labelte)*100;
        count=0;
    end
    %% Analysis
    valper=max(per(:,2));
    valtime=toc; % Time for each value of learning rate
    output=[output;l,valtime,valper];
end
% end
