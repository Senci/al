# Setup training data
n1 = 30;
n2 = 30;
train_data_class1 = rand(n1,2);
train_data_class2 = rand(n2,2) + ones(n2,2)*[1 0; 0 0];
train_data  = [train_data_class1 ; train_data_class2];
train_label(1:n1) = 1;
train_label(n1+1:n1+n2) = 2;

# Setup testing data
n3 = 1000;
n4 = 50;
test_data_class1 = rand(n3,2);
test_data_class2 = rand(n4,2) + ones(n4,2)*[1 0; 0 0];
test_data  = [test_data_class1 ; test_data_class2];
test_label(1:n3) = 1;
test_label(n3+1:n3+n4) = 2;

# Plot train data
figure(1); clf; hold all; axis equal;
plot(train_data(1:n1,1), train_data(1:n1,2), 'r*');
plot(train_data(n1+1:n1+n2,1), train_data(n1+1:n1+n2,2), 'bo');

# Plot test data
figure(2); clf; hold all; axis equal;
plot(test_data(1:n3,1), test_data(1:n3,2), 'r*');
plot(test_data(n3+1:n3+n4,1), test_data(n3+1:n3+n4,2), 'bo');

# Classify training data for different k-values with knnClassify.
# and calculate the test errors for these values.
k_values = [1, 3, 5, 7, 10, 15, 20];
for k = 1:length(k_values)
	pred_train = knnClassify(train_data, train_label, train_data, k);
	errTrain(k) = loss01(pred_train, train_label);
	pred_test = knnClassify(train_data, train_label, test_data, k);
	errTest(k) = loss01(pred_test, test_label);
end

# Plot training data and test errors.
figure(3); clf; hold all;
plot(k_values, errTrain, 'r*:');
plot(k_values, errTest, 'b.-');

# Plot pred_test for the k = 1
pred_test_k_1 = knnClassify(train_data, train_label, test_data, 1);
figure(4); clf; hold all; axis equal;
pred_class1 = find(pred_test_k_1==1);
pred_class2 = find(pred_test_k_1==2);
plot(test_data(pred_class1,1),test_data(pred_class1,2),'r*');
plot(test_data(pred_class2,1),test_data(pred_class2,2),'bo');
plot([1 1],[0 1],'k');