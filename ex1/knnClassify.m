function pred = knnClassify(train_data, train_label, test_data, k)
	data_length = length(test_data);

	for i = 1:data_length
		i_dist = pdist2(train_data, test_data(i,:));
		i_dist = [distance(:,i), (1:data_length)'];
		i_dist = sortrows(i_dist);

		% count the occurence of class 1 and save it in counter.
		counter = length(find(train_label(i_dist(1:k,2))==1))

		% if the counter value is positive, the majority of kNNs is in class '1'.
		% else if they are negative, the majority of kNNs is in class '2'.
		if (counter > k/2)
			i_class = 1;
		elseif (counter < k/2)
			i_class = 2;
		else
			if (rand > 0.5)
				i_class = 1;
			else
				i_class = 2;
			end
		end

		test_data(i) = i_class;
	end
	pred = test_data
end