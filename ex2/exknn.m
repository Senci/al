
n1 = 200; train_data_class1 = rand(n1,2);
n2 = 200; train_data_class2 = rand(n2,2) + ones(n2,2)*[1 0; 0 0];
train_data = [train_data_class1 ; train_data_class2];
train_label(1:n1) = 1;
train_label(n1+1:n1+n2) = 2;

figure (1); clf; hold all; axis equal;
plot(train_data(1:n1,1), train_data(1:n1,2), 'r*');
plot(train_data(n1+1:n1+n2,1), train_data(n1+1:n1+n2,2), 'bo');

n3 = 100; test_data_class1 = rand(n3,2);
n4 = 100; test_data_class2 = rand(n4,2) + ones(n4,2)*[1 0; 0 0];
test_data = [test_data_class1 ; test_data_class2];
test_label(1:n3) = 1;
test_label(n3+1:n3+n4) = 2;

k_values=[1, 3, 5, 7, 10, 15, 20];
evres=keval(k_values,train_data,train_label',test_data,test_label');

figure(2); hold all;
plot(k_values,evres(:,1),'r*:');
plot(k_values,evres(:,2), 'b.-');

% 7. ja die Ergebnisse aendern sich weil sich die Anzahl der Nachbarn,
% welche fuer die Klassifizierung benutzt werden, aendert

%8. verstehe ich nicht was gemacht werden soll

% 9. vergroessert sich die Anzahl der Trainingsdaten wird zwar der trainError
% groesser aber der testError kleiner (die Performance wird besser)

% 10. sowohl train als auch test error steigen (die Performance sinkt)


