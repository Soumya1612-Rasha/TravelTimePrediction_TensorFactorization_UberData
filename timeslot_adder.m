function [y2] = timeslot_adder(y2,uber_matrix)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
tripid=uber_matrix(:,1);

n=unique(tripid);
l=length(n);
for i=1:l
    r=find(y2(:,1)==n(i));
    x=uber_matrix((tripid==n(i)),2);
    y2(r,6)=x(1,1);
end

