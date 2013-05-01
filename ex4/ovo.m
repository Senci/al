load('usps_train.mat');
load('usps_test.mat');



trList = find(train_label==1 | train_label==2 | train_label==3 | train_label==4);
x_train = double(train_data(trList,:));
y_train = double(train_label(trList));

teList = find(test_label==1 | test_label==2 | test_label==3 | test_label==4);
x_test = double(test_data(teList,:));
y_test = double(test_label(teList));

y_einzel=zeros(length(y_test),6);
k=1;
for i=1:3    
   for j=i+1:4
       trList = find(train_label==i | train_label==j);
        x_train = double(train_data(trList,:));
        y_train = double(train_label(trList));
        cls = ClassificationDiscriminant.fit(x_train,y_train);        
        y_einzel(:,k)=predict(cls,x_test); 
        k=k+1;
   end   
end

y_pred=mode(y_einzel,2);

errovo=loss01(y_pred,y_test);