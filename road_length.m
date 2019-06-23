function [m] = road_length( road_list,grid_lat,grid_lon)
%This functions is for finding length of road segments
%There may be three different kinds of roads:
%1.horizontal roads whose length is average longitude change
%2.vertical roads whose length is averge latitude changes
%3.diagonal roads whose length is equal to square root of sum of squared
%latitude and longitude change
diag_width=sqrt((grid_lat).^2+(grid_lon).^2);
m=zeros(12043,1);
n=unique(road_list(:,1));
l=length(n);
for i=1:l
    r=road_list(road_list(:,1)==n(i),:);
    l_1=size(r,1);
    if(l_1==3)
        road_1=r(1,3);
        road_2=r(2,3);
        road_3=r(3,3);
        m(road_1,1)=grid_lon;
        m(road_2,1)=diag_width;
        m(road_3,1)=grid_lat;
    end
    if(l_1==4)
        road_1=r(1,3);
        road_2=r(2,3);
        road_3=r(3,3);
        road_4=r(4,3);
        m(road_1,1)=grid_lon;
        m(road_2,1)=diag_width;
        m(road_3,1)=grid_lat;
        m(road_4,1)=diag_width;
    end
    if(l_1==2)
        road_1=r(1,3);
        road_2=r(2,3);
        m(road_1,1)=diag_width;
        m(road_2,1)=grid_lon;
        
    end
    if(l_1==1)
        road_1=r(1,3);
        m(road_1,1)=grid_lat;
    end
end

