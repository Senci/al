function pred = knnClassify(train_data, train_label, test_data, k);
%KNNCLASSIFY Summary of this function goes here
%   Detailed explanation goes here
 zw=knnclassify(test_data,train_data,train_label,k);
 pred=zw';

end

