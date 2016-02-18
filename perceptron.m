%% Initialization
clear all; close all; clc;
load data;
fea=full(fea);
%% Reading the data from .svm file
% addpath('/home/dhingratul/Dropbox/Academics/Spring2016/CS-536/HW/HW2/Code/References/libsvm-3.21/matlab');
% [label, fea]=libsvmread('webspam_wc_normalized_unigram.svm');
%%
[train, test, labeltr, labelte]=datapartition(fea, label, 250000);