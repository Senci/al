function [ err ] = lossL2(Y,Y_pred)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

err=sum((Y_pred-Y).^2)/length(Y);
end

