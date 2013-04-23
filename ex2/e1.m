load('20Newsgroup.mat');
trList = find(y_train==6 | y_train==8);
x_train_6_8 = x_train(trList,:);
y_train_6_8 = y_train(trList);

x_test_cropped = x_test(:,1:size(x_train,2));
teList = find(y_test==6 | y_test==8);
x_test_6_8 = x_test_cropped(teList,:);
y_test_6_8 = y_test(teList);



k_values=[1, 3, 5, 7, 10, 15, 20];

evres=keval(k_values,x_train_6_8,y_train_6_8,x_test_6_8,y_test_6_8);

figure(2); hold all;
plot(k_values,evres(:,1),'r*:');
plot(k_values,evres(:,2), 'b.-');