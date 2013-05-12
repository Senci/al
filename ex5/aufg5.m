load('cancer-data.mat');
crosp = cvpartition(cancerTarget_train,'kfold',10);
optstruc=statset('MaxIter',Inf,'Display','off');
C=[0.01,0.1,1,10,50];
errors=ones(length(C),2);
for i=1:length(C)  
  anz_trerr=0;
  anz_teerr=0;
    for j=1:10
       model=svmtrain(cancerInput_train(crosp.training(j),:),cancerTarget_train(crosp.training(j),:),'boxconstraint',C(i),'options',optstruc);
       predTrain=svmclassify(model,cancerInput_train(crosp.training(j),:),'showplot',false);
       predTest=svmclassify(model,cancerInput_train(crosp.test(j),:),'showplot',false);
       trerr=predTrain~=cancerTarget_train(crosp.training(j));
       teerr=predTest~=cancerTarget_train(crosp.test(j));
       anz_trerr=anz_trerr+sum(trerr==1);
       anz_teerr=anz_teerr+sum(teerr==1);
    end
    errors(i,1)=anz_trerr/(crosp.TrainSize(j)*10);
    errors(i,2)=anz_teerr/(crosp.TestSize(j)*10);
end

%with increasing C the training error decreases