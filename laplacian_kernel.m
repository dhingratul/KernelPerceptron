%% Laplacian Kernel
% Input: x, y, sigma
% Output: Dot Product
% Note: Run from kperceptron.m
function [dotp]=laplacian_kernel(x,y,sig)
if nargin<3
    sig=0.2;
end

dotp=exp(-norm(x-y)/(sig));
end