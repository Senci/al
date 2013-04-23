function results = keval( k_values,train_data,train_label,test_data,test_label )
%KEVAL Summary of this function goes here
%   Detailed explanation goes here
results=ones(length(k_values),2);
for i = 1:length(k_values)
    results(i,1)=loss01(knnClassify(train_data, train_label, train_data, k_values(i)),train_label');
    results(i,2)=loss01(knnClassify(train_data, train_label, test_data, k_values(i)),test_label');
end

end

