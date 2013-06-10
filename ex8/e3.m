n=200;
d=3;
mu=[0,0,0];
Sigma=[2 0 0;0 1 0;0 0 4];

S1 = chol(Sigma);
X = repmat(mu,n,1) + randn(n,d)*S1;

[V,D] = eig(Sigma);

eva=[3,0;0,1];
eve=(sqrt(2)/2)*[1,2;-1,1];
sig2=eve*eva*eve';
mu2=[0,0];
n2=400;
d2=2;

S2 = chol(sig2);
X2 = repmat(mu2,n2,1) + randn(n2,d2)*S2;

hold all;
plot(X2(:,1),X2(:,2),'*');
plot(eve(:,1),eve(:,2),'r');
