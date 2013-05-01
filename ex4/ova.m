load('usps_train.mat');
load('usps_test.mat');



trList = find(train_label==1 | train_label==2 | train_label==3 | train_label==4);
x_train = double(train_data(trList,:));
y_train = double(train_label(trList));

teList = find(test_label==1 | test_label==2 | test_label==3 | test_label==4);
x_test = double(test_data(teList,:));
y_test = double(test_label(teList));

%one vs all

ovay_train=ones(length(y_train),4);
for i=1:4;
   tmpind=find(y_train~=i);
   y_tmp=y_train;
   y_tmp(tmpind)=0;
   ovay_train(:,i)=y_tmp; 
end

cls=ClassificationDiscriminant.fit(x_train,y_train);
cls1 = ClassificationDiscriminant.fit(x_train,ovay_train(:,1));
cls2 = ClassificationDiscriminant.fit(x_train,ovay_train(:,2));
cls3 = ClassificationDiscriminant.fit(x_train,ovay_train(:,3));
cls4 = ClassificationDiscriminant.fit(x_train,ovay_train(:,4));

y_werte=ones(length(y_test),4);
y_werte(:,1)=(x_test*cls1.Coeffs(2,1).Linear)+cls1.Coeffs(2,1).Const;
y_werte(:,2)=(x_test*cls2.Coeffs(2,1).Linear)+cls2.Coeffs(2,1).Const;
y_werte(:,3)=(x_test*cls3.Coeffs(2,1).Linear)+cls3.Coeffs(2,1).Const;
y_werte(:,4)=(x_test*cls4.Coeffs(2,1).Linear)+cls4.Coeffs(2,1).Const;

y_pred=zeros(length(y_test),1);
for i=1:length(y_pred)
   y_pred(i)=find(y_werte(i,:)==max(y_werte(i,:))); 
end

errova=loss01(y_pred,y_test);