function err = loss01(y_pred, y)
	data_size = size(y_pred)(2);
	error_count = 0;
	for i = 1:data_size
		if (y_pred(i) != y(i))
			error_count = error_count+1;
		end
	end
	avarage_error = error_count/data_size;
	err = avarage_error
endfunction