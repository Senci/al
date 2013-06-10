load('usps_train.mat');

trList = find(train_label==5);
x_train = double(train_data(trList,:));
y_train = double(train_label(trList));

[COEFF,SCORE] = princomp(x_train);

dig = reshape(COEFF(:,1),16,16);
imagesc(dig);
colormap('gray');

dig = reshape(COEFF(:,2),16,16);
imagesc(dig);
colormap('gray');

