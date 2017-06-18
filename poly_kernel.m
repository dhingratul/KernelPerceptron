%% Polynomial Kernel
% Input: x, y, p
% Output: Dot Product
% Note: Run from kperceptron.m
function[dotproduct]=poly_kernel(x,y,p)
if nargin < 3
    p = 2;
end
dotproduct=(1+(x*y'))^p;
end