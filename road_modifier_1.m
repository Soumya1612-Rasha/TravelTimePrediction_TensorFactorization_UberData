function [z,rows] = road_modifier_1(y1)
%THE MATRIX TO THIS FUNCTION SHOULD BE IN FOLLOWING FORMAT
%TRIPID/STARTING CENTRE/ENDING CENTRE/TRAVELTIME/ROAD SEGMENT/TIMESLOT
%THIS FUNCTION LISTS THE CENTRES WHICH ARE NOT JUNCTIONS 
%PASS THE OUTPUT OF THIS FUNCTION TO road_modifier_2.m
z=[];
rows=[];
tripid=y1(:,1);
n=unique(tripid);
l=length(n);

for i=1:l
    r=y1(tripid==n(i),:);
    if(~isempty(r))
        centres=r(:,[2,3]);
        l_1=size(centres,1);
        if(l_1>1)
            for j=2:l_1
                centre_1=centres(j,1);
                %centre_2=centres(j+1,1);
                [crossing]=neighbours_finder(centre_1,y1);
                if(crossing==0)
                    traveltime=r(j,4)+r(j-1,4);
                    f=horzcat(n(i),centres(j-1,1),centres(j,2),traveltime,r(j-1,5),r(j,6));
                    z=vertcat(z,f);
                    m_1=[n(i),j-1;n(i),j];
                    rows=vertcat(rows,m_1);
                end
            end
        end
    end
end
end

function [r]=neighbours_finder(centre,y)
    r_1=find(centre==y(:,2));
    r_2=find(centre==y(:,3));
    r_3=unique(y(r_1,3));
    r_4=unique(y(r_2,2));
    c=union(r_3,r_4);
    r=length(c)-2;   
end
