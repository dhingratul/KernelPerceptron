%% Sigmoid Kernel
% Input: x, y, parameters(c, p)
% Output: Dot Product
% Note: Run from kperceptron.m
function[dotproduct]=sigmoid_kernel(x,y,c,p)
if nargin < 3
    p = 0.1;
    c=1;
end
dotproduct=tanh(c+p*(x*y'));
end