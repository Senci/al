sigma = [0.01 0.1 0.4 0.9 1];

results=ones(length(sigma),1);
er_run=ones(10,1);
for i=1:length(sigma)
    for j=1:10
        [X_train,Y_train] = genLinData(50,sigma(i));
        [X_test,Y_test] = genLinData(30,sigma(i));
        X_train=[X_train,ones(length(X_train),1)];
        X_test=[X_test,ones(length(X_test),1)];
        w=LLS(X_train,Y_train);
        Y_pred=X_test*w;    
        er_run(j)=lossL2(Y_test,Y_pred);
    end
    results(i)=sum(er_run)/length(er_run);
end

plot(sigma,results,'b')

