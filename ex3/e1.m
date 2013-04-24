sigma = 0.1;
[X_train,Y_train] = genLinData(50,sigma);
[X_test,Y_test] = genLinData(30,sigma);

figure (1); clf; hold all;
plot(X_train,Y_train,'.r');
plot(X_test,Y_test,'.b');

% zufaellige x werte zwischen -2 und 2
%normalverteilte noise
%y werte die mit Faktor -0.7 linear von x abhaengig sind
%um 1 (intercept)+noise erhoeht

X_train=[X_train,ones(length(X_train),1)];
X_test=[X_test,ones(length(X_test),1)];

w=LLS(X_train,Y_train);

figure (2); clf; hold all;
plot(X_train(:,1),Y_train,'.b');
plot(X_train(:,1),X_train*w,'r');

Y_pred=X_test*w;
plot(X_test(:,1),Y_pred,'.g');

lossL2(Y_test,Y_pred);


%1.8
sigma = 0.1;
[X_train,Y_train] = genLinData(50,sigma);
[X_test,Y_test] = genLinData(30,sigma);

X_train = [X_train;10];
Y_train = [Y_train;10];

X_train=[X_train,ones(length(X_train),1)];
X_test=[X_test,ones(length(X_test),1)];
w=LLS(X_train,Y_train);

figure (2); clf; hold all;
plot(X_train(:,1),Y_train,'.b');
plot(X_train(:,1),X_train*w,'r');

Y_pred=X_test*w;
plot(X_test(:,1),Y_pred,'.g');

lossL2(Y_test,Y_pred);