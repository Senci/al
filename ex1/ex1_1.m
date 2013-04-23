# Setup training data
n1 = 100;
train_data_class1 = rand(n1,2);
n2 = 100;
train_data_class2 = rand(n1,2) + ones(n2,2)*[1 0; 0 0];
train_data  = [train_data_class1 ; train_data_class2];
train_label(1:n1) = 1;
train_label(n1+1:n1+n2) = 2;

# Classify training data for different k-values with knnClassify.
# and calculate the test errors for these values.
k_values = [1, 3, 5, 7, 10, 15, 20];
for k = 1:length(k_values)
	predTrain = knnClassify(train_data, train_label, test_data, k)
	errTrain(k) = loss01(predTrain(k), train_label);
end

# Plot Data
figure(1); clf; hold all; axis equal;
plot(train_data(1:n1,1), train_data(1:n1,2), 'r*');
plot(train_data(n1+1:n1+n2,1), train_data(n1+1:n1+n2,2), 'bo');

# Plot training data and test errors.
figure(2); hold all;
plot(k_values, errTrain, 'r*:');
plot(k_values, errTrain, 'b.=');