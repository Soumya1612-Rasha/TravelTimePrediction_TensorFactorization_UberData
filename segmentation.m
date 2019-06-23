function [x,timestamp] = segmentation(x,timestamp)
%THE INPUT TO THIS FUNCTION MATRIX X SHOULD BE IN FOLLOWING FORMAT
%TRIPID/TIMESLOT/LATITUDE/LONGITUDE
latitude=x(:,3);
longitude=x(:,4);
r=((latitude>37.73& latitude<37.8) & (longitude>-122.45 & longitude <-122.4));
r_1=find(~r);
tripid=x(:,1);
ids=zeros(length(r_1),1);
for i=1:length(r_1)
    x=r_1(i);
    y=tripid(x);
    ids(i,1)=y;
    
end
id_unique=unique(ids);
tripid=x(:,1);
r_2=[];
for i=1:length(id_unique)
    r=(tripid==id_unique(i,1));
    r_1=find(r);
    r_2=vertcat(r_2,r_1);
    
end
x(r_2,:)=[];
timestamp(r_2,:)=[];
end
