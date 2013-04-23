function err = loss01(y_pred,y);
%LOSS01 Summary of this function goes here
%   Detailed explanation goes here

    zw1=y_pred ~=y;
    anz_err=sum(zw1==1);
    err=anz_err/length(y);
end

