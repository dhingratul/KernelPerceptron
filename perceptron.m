 % function[per,time]=perceptron(T)
%% Initialization
load data;
fea=full(fea);
count=0; per=0;
% % % Reading the data from .svm file
% % addpath('/home/dhingratul/Dropbox/Academics/Spring2016/CS-536/HW/HW2/Code/References/libsvm-3.21/matlab');
% % [label, fea]=libsvmread('webspam_wc_normalized_unigram.svm');
%%
[train, test, labeltr, labelte]=datapartition(fea, label, 250000);
    
tic;
w=zeros(1,size(train,2)); % Each feature has a weight
b=0;
wb=1;
%% Learning
for T=1:1%iter % Number of iterations to convergence
    tic;
for i=1:size(train,1)

    if(labeltr(i,1)*(w*train(i,:)'+b)<=0)
        w=w+labeltr(i,1)*train(i,:);
        b=b+labeltr(i,1);
    end
end
time(T,1)=toc;
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
per(T,1)=count/length(labelte)*100;
count=0; 
end
% end
