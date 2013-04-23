[X,Y] = mixGaussian1d(1000,0.5,0.5,0,6,1,2);

plot(X,Y,'r*:');
plot(X,'o');

figure (1); clf; hold all;
[countC,binsX] = hist(X,30);
PX = countC/size(X,1);
plot(binsX,PX,'.-');

prior1=length(find(Y==1))/length(Y);
prior2=length(find(Y==2))/length(Y);