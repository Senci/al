function [ out ] = hinge( x,y,w,b )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

out=0;
for i=1:length(x)
    out=out+max(0,1-(y(i)*(x(i,:)*w+b)));
end
out=out/length(x);
end

