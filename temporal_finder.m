function [X] = temporal_finder(x)
%This functions helps to find the traffic condition by finding the grids
%traversed in a given time slot.The matrix x is in following format:
%TRIPID/TIMESLOT/CENTRE
timedata=x(:,2);
closest2=x(:,3);
X=zeros(168,3096);
[C,ia,idx]=unique(timedata,'stable');
len=length(ia);

for i=1:len
    p=C(i);
    r=closest2(timedata==timedata(i));
    l_1=length(r);
    for j=1:l_1
        g=r(j);
        X(p,g)=X(p,g)+1;
    end
end
end

