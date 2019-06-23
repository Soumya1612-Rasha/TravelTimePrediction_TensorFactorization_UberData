function [grid_lat,grid_lon] = averagetravel(x)
%THE INPUT MATRIX X SHOULD BE IN THE FOLLOWING FORMAT
%TRIPID/TIMESLOT/LATITUDE/LONGITUDE
%THE FUNCTION FINDS THE AVERAGE CHANGE IN LATITUDE AND LONGITUDE TRAVERSED BY CABS IN 20 SECS 
latdiff=[];
londiff=[];
n=unique(tripid);
for i=1:length(n)
    r=x(tripid==n(i),:);
    if(~isempty(r)&& size(r,1)>=5)
        lat_diff=abs(r(5,3)-r(1,3));
        lon_diff=abs(r(5,4)-r(1,4));
        latdiff=vertcat(latdiff,lat_diff);
        londiff=vertcat(londiff,lon_diff);
    end
end
grid_lat=sum(latdiff)/length(latdiff);
grid_lon=sum(londiff)/length(londiff);
end

