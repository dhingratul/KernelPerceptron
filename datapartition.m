function [train, test, labeltr, labelte]=datapartition(features, labels, split_tr)
    
        train=features(1:split_tr,:);
        labeltr=labels(1:split_tr,:);
        test=features(split_tr+1:end,:);
        labelte=labels(split_tr+1:end,:);
    
end