function[dotproduct]=sigmoid_kernel(x,y,c,p)
    if nargin < 3
	p = 0.1;
    c=1;
    end
    dotproduct=tanh(c+p*(x*y'));
end