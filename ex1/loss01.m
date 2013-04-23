function err = loss01(y_pred, y)
	error_count = 0;
	for i = 1:length(y_pred)
		if (y_pred(i) != y(i))
			error_count = error_count+1;
		end
	end
	avarage_error = error_count/length(y_pred);
	err = avarage_error;
end