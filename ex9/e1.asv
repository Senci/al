load('usps_train.mat');
numbers=[1,3,4,6];
X=[];
Y=[];

for i=1:length(numbers)
    trList = find(train_label==numbers(i));
    x_train = double(train_data(trList(1:200),:));
    y_train = double(train_label(trList(1:200)));
    X=[X;x_train];
    Y=[Y;y_train];
end

par=statset('Display','final');

IDX = kmeans(X,length(numbers),'Options',par,'Replicates',5);

%Since we know the true classes, the 01-loss seems to be a good choice.
%Normally we don't know the true classes and there may be enteties that belong to more than 1 class.
erg=zeros(length(IDX),1);
for i=1:length(IDX)
   erg(i)=numbers(IDX(i)); 
    
end

tmp1=erg~=Y;
err_anz=sum(tmp1==1);
err=err_anz/length(Y);

%if we don't know the ground-truth of our data, we can take the relation of
%inner-class distance to between class distance

%The parameter 'distance' tells how the distance between the points is
%calculated.

IDX2 = kmeans(X,length(numbers),'Options',par,'Replicates',5,'distance','cosine');

erg=zeros(length(IDX2),1);
for i=1:length(IDX2)
   erg(i)=numbers(IDX2(i)); 
    
end

tmp1=erg~=Y;
err_anz=sum(tmp1==1);
err2=err_anz/length(Y);

IDX3 = kmeans(X,length(numbers),'Options',par,'Replicates',5,'distance','cityblock');

IDX3=flipud(IDX3);

erg=zeros(length(IDX3),1);
for i=1:length(IDX3)
   erg(i)=numbers(IDX3(i)); 
    
end

tmp1=erg~=Y;
err_anz=sum(tmp1==1);
err3=err_anz/length(Y);

%if the data consists of 2 dimensional discrete values