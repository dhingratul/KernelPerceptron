function [dot]=gaussian_kernel(x,y,sig)
if nargin<3
    sig=0.1;
end
    dot=exp((norm(x-y)^2)/2*(sig^2));
end