load('usps_train.mat');
load('usps_test.mat');

trList = find(train_label==4 | train_label==9);
x_train = double(train_data(trList,:));
y_train = double(train_label(trList));

teList = find(test_label==4 | test_label==9);
x_test = double(test_data(teList,:));
y_test = double(test_label(teList));

cls = ClassificationDiscriminant.fit(x_train,y_train);

figure(1);clf, hold all;
dig = reshape(cls.Coeffs(1,2).Linear,16,16);
imagesc(dig);

pred=predict(cls,x_test);
err01=loss01(pred,y_test);