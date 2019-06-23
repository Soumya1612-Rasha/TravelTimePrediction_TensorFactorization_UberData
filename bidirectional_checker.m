function [m] = bidirectional_checker(nodes,road_list)
%This functions checks if a given road segment is bidirectional or
%unidirectional.
m=zeros(length(road_list),1);
l=size(nodes,1);
for i=1:l
    node1=nodes(i,1);
    node2=nodes(i,2);
    r=find(node1==nodes(:,2) & node2==nodes(:,1));
    if(~isempty(r))
        road_segment=nodes(i,3);
        m(road_segment,1)=1;
    end
end
    

end

