X = [-3 3;-3 2;-2 3;-1 1;1 3;2 2;2 3;3 1];
Y = [-1 -1 -1 -1 1 1 1 1]';
C=1;
d=2;
n=8;
cvx_begin
    variables w(d) b xi(n)
    dual variable lambda
    minimize 1/2*sum(w.*w) + C/n*sum(xi)
    lambda : Y.*(X*w + b) >= 1 - xi;
    xi >= 0;
cvx_end

lambda
w
%support vectors are the value-pairs 3,4,5,6

for j=1:n
    test=lambda(j)*(Y(j)*(w'.*X(j,:)+b)-1+xi(j))    
    
end

test1=lambda*(Y*(w*X+b)-1+xi)

K = X*X';
cvx_begin
    variables alpha(n) %you don't have anything with size d
    maximize( sum(alpha) - 0.5*quad_form(Y.*alpha,K) )
    alpha>=0;
    alpha<=C/n;
    alpha'*Y==0;
cvx_end

alpha-lambda