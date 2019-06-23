function [y1] = road_modifier_2(row,y1,z)
%THIS FUNCTION TAKES INPUT THE OUTPUT OF THE road_modifier_1.m AND ALSO THE
%MATRIX 

tripid=row(:,1);
n=unique(tripid);
l=length(n);
row_1=[];
for i=1:l
    r=row(tripid==n(i),:);
    r_y=find(y1(:,1)==n(i));
   
    r_1=y1(y1(:,1)==n(i),:);
    r_2=r(:,2);
    r_1(r_2,:)=[];
    y1(r_y,:)=[];
    row_1=vertcat(row_1,r_1);

end
y1=vertcat(y1,row_1,z);
