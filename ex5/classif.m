function [ out ] = classif( trains,traint,tests,testt )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
a=1;
model=svmtrain(trains,traint,'boxconstraint',1);
pred=svmclassify(model,tests,'showplot',false);
out=pred~=testt;

end

