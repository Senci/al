load('dataRidge.mat');


% 1.2
x_train=[x_train,ones(length(x_train),1)];
x_test=[x_test,ones(length(x_test),1)];

w=LLS(x_train,y_train);
y_pred=x_test*w;

figure (1); clf; hold all;
plot(x_train(:,1),y_train,'.b');
plot(x_train(:,1),x_train*w,'r');
plot(x_test(:,1),y_pred,'.g');
% Warning: Rank deficient, rank = 2, tol =  1.446044e-14.