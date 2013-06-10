mu=[1,1];
Sigma=[2,-1;-1,2];
d=2;
n=500;
S1 = chol(Sigma);
X = repmat(mu,n,1) + randn(n,d)*S1;

tmp1=X-repmat(mu,size(X,1),1);
C=cov(tmp1);
[V,D] = eig(C);
[V2,D2]=eig(Sigma);
V2-V;