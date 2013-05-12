load('cancer-data.mat')
nfolds=10;
crosp = cvpartition(cancerTarget_train,'kfold',nfolds);
Cvec=[0.01,0.1,1,10,50];
errors=ones(length(Cvec),2);
n=9;
for i=1:length(Cvec)
    C=Cvec(i);
    tmp=ones(nfolds,2);
    for j=1:nfolds
        m=crosp.TrainSize(j);
        y=cancerTarget_train(crosp.training(j))';
        X=cancerInput_train(crosp.training(j),:);
        cvx_begin
            variables w(n) b xi(m)
            minimize 1/2*sum(w.*w) + C*sum(xi)
            y'.*(X*w + b) >= 1 - xi;
            xi >= 0;
        cvx_end
        tmp(j,1)=hinge(cancerInput_train(crosp.training(j),:),cancerTarget_train(crosp.training(j)),w,b);
        tmp(j,2)=hinge(cancerInput_train(crosp.test(j),:),cancerTarget_train(crosp.test(j)),w,b);
    end
    errors(i,1)=sum(tmp(:,1))/nfolds;
    errors(i,2)=sum(tmp(:,2))/nfolds;
end
