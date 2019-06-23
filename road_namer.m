function [road_list ] = road_namer( centres )
%This functions creates a record of each road segment along with their
%starting and ending nodes
%The input to this function is the output of script centre.m

l=length(centres);
h=1;
r=77;%THIS IS THE NUMBER OF THE CENTRES IN ONE COLUMN
road_list=[];
m=1:77:l-r+1;
n=1:41;%NUMBER OF COLUMNS
for i=1:l-1  %Finding out each trip id 
    
    if(i~=n*r & i<=l-r)        %Checking if the road segment is not on the last row or last column  
          f=horzcat(i,i+r,h);
          h=h+1;
          f_1=horzcat(i,i+r+1,h);
          h=h+1;
          f_2=horzcat(i,i+1,h);
          h=h+1;
          if(i~=m)              %Checking if the road segment is not on the first column
              f_3=horzcat(i,i+r-1,h);
              h=h+1;
              road_list=vertcat(road_list,f,f_1,f_2,f_3);
          else
              road_list=vertcat(road_list,f,f_1,f_2);
          end
    else if(i<=l-r)            %Checking if the road segment is not on last column
            f=horzcat(i,i+r-1,h);
            h=h+1;
            f_1=horzcat(i,i+r,h);
            h=h+1;
            road_list=vertcat(road_list,f,f_1);
        else if(i~=l)         %Checking if the road segemnt is not the last centre
            f=horzcat(i,i+1,h);
            h=h+1;
            road_list=vertcat(road_list,f);
            end
        end
    end
end
end



