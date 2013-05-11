load('cancer-data.mat');

classif=svmtrain(cancerInput_train,cancerTarget_train,'boxconstraint',1);
pred=svmclassify(classif,cancerInput_test,'showplot',false);
out=pred~=cancerTarget_test;

test=classif(cancerInput_train,cancerTarget_train,cancerInput_test,cancerTarget_test);

crosp = cvpartition(cancerTarget_train,'kfold',10);
%t2=crossval(classif,cancerInput_train,cancerTarget_train,'partition',crosp);

C=[0.01,0.1,1,10];
out=ones(length(C),10);
for i=1:length(C)
  
    for j=1:10
       model=svmtrain(cancerInput_train(crosp.training(j),:),cancerTarget_train(crosp.training(j),:),'boxconstraint',C(i));
       pred=svmclassify(model,cancerInput_train(crosp.test(j),:),'showplot',false);
       tmp1=pred~=cancerTarget_train(crosp.test(j));
       anz_err=sum(tmp1==1);
       err=anz_err/crosp.TestSize(j);
       out(i,j)=err;
    end
end