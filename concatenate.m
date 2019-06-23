function [total_time] = concatenate(query_path,reconstruct_tensor)
%Query Path is the path of which travel time has to be calulated
%reconstruct_tensor is the tensor formed after tucker decomposition and
%reconstruction
average_travel=[];
for i=1:length(query_path)
    x=query_path(i,1);
    y=double(reconstruct_tensor(x,:,:));
    l=length(find(y));
    n=norm(y,1);
    travel_time=n/l;
    average_travel=vertcat(average_travel,travel_time);
end
total_time=sum(average_travel);
    



end

