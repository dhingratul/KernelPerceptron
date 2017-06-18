%% Exponential Kernel
% Input: x, y, sigma
% Output: Dot Product
% Note: Run from kperceptron.m
function [dotp]=exp_kernel(x,y,sig)
if nargin<3
    sig=0.2;
end

dotp=exp(-norm(x-y)/(2*sig^2));
end