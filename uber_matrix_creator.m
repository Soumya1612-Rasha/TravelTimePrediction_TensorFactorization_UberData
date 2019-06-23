function [y1,r] = uber_matrix_creator(y1,road_list)
%This function has records of road segments and trajectory of each trip as
%input.It collects information from the road_list and then assigns the road
%segments for each trip.
l=size(y1,1);
r=[];
for i=1:l
    centre1=y1(i,2);
    centre2=y1(i,3);
    [road_segment,r]=road_finder(centre1,centre2,road_list,r);
    y1(i,5)=road_segment;

end
end

function [road_segment,r]=road_finder(centre1,centre2,road_list,r)

m=12044;
r=find(road_list(:,1)==centre1 & road_list(:,2)==centre2);
r_1=find(road_list(:,2)==centre1 & road_list(:,1)==centre2);
if(~isempty(r))
    road_segment=road_list(r,3);
    return
end
if(~isempty(r_1))
    road_segment=road_list(r_1,3);
    return
end
road_segment=m;
f=horzcat(centre1,centre2,m);
r=vertcat(r,f);
m=m+1;


end
