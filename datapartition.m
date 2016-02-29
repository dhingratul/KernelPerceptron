function [train, test, labeltr, labelte]=datapartition(features, labels, split_tr)
        features=full(features);
%% Random samples        
%         orderedArray=[labels,features];
%         shuffledArray = orderedArray(randperm(size(orderedArray,1)),:);
%         features=shuffledArray(:,2:end);
%         labels=shuffledArray(:,1);
%% Data split into Train and test
        train=features(1:split_tr,:);
        labeltr=labels(1:split_tr,:);
        test=features(split_tr+1:end,:);
        labelte=labels(split_tr+1:end,:);
%    shuffledArray = orderedArray(randperm(size(orderedArray,1)),:); 
end