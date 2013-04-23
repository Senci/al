[X Y] = mixGaussian2d(100,0.4,0.6);

all1=X(find(Y==1),:);
all2=X(find(Y==2),:);

mean(all1)
mean(all2)

cov(all1(:))
cov(all2(:))