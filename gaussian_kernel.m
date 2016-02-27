function [dotp]=gaussian_kernel(x,y,sig)
if nargin<3
    sig=0.1;
end
  
    dotp=exp(-norm(x-y)/(2*sig^2));
end