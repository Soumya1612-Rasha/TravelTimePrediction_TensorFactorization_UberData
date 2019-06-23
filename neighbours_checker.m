function [m] = neighbours_checker(y1)
%ThIS FUNCTION FINDS THE NUMBER OF ROAD SEGMENTS BRANCHING FROM TWO
%TERMINALS OF A GIVEN ROAD SEGMENT.
m=zeros(12044,1);

l=length(y1);
for i=1:l
    centre1=y1(i,2);
    centre2=y1(i,3);
    roadid=y1(i,5);
    r_1=neighbours_finder(centre1,y1);
    r_2=neighbours_finder(centre2,y1);
    total_neighbours=r_1+r_2-1;
    m(roadid,1)=total_neighbours;
end

end
    function [r]=neighbours_finder(centre,y)
    m_1=find(centre==y(:,2));
    m_2=find(centre==y(:,3));
    r_3=unique(y(m_1,3));
    r_4=unique(y(m_2,2));
    c=union(r_3,r_4);
    r=length(c);   
    end
