function [ w ] = RidgeLLS(X,Y,lambda)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

w=inv(X'*X+lambda*eye(4))*X'*Y
end

