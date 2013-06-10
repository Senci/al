load('usps_train.mat');
numbers=[1,2,3,4];
X=[];
Y=[];

for i=1:length(numbers)
    trList = find(train_label==numbers(i));
    x_train = double(train_data(trList(1:300),:));
    y_train = double(train_label(trList(1:300)));
    X=[X;x_train];
    Y=[Y;y_train];
end

k=20;

A = buildKnnGraph(X,k);
D = graphallshortestpaths(A,'Directed', false);
xy = Isomap(D,2);
figure;
scatter(xy(:,1),xy(:,2),10,Y,'filled');

%larger K leads to more spreaded classes (greater inner class variance)