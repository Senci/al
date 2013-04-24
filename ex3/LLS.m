function [ w ] = LLS( X,Y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%w=inv(X'*X)*X'*Y;
%nicht nehmen weil ineffizient
%w=(X'*X)\(X'*Y);
%Lsg. laut Vorlesung
w=X\Y;
%funktioniert hier auch :-)
end

