function [y] = centre_finder( x,timestamp )
%This function finds average travel time of all the pairs if more than one points lie on same grid  
tripid=x(:,1);
n=unique(tripid);
l=length(n);
y=[];

for i=1:l
    r=x((tripid==n(i)),:);
    time=timestamp(tripid==n(i));%for each trip id
   
    if(~isempty(r))%if trip id does not exist
           traveltime=r(:,4);
           centres=r(:,5);
           c=unique(centres,'stable');
           l_c=length(c);
           for j=1:l_c-1%for every centre in a trip id
                 traveltime_1=traveltime(j);
                 r_1=centres(centres==c(j));
                 timedata_1=time(centres==c(j));
                 r_2=centres(centres==c(j+1));
                 timedata_2=time(centres==c(j+1));
                 if (length(r_1)>1 || length(r_2)>1) 
                    t=[];
                    for k=1:length(r_1)
                        for z=1:length(r_2)
                            t_1=seconds(timedata_2(z)-timedata_1(k));
                            t=vertcat(t,t_1);
                        end
                    end
                    t=sum(t)/length(t);
                    y=vertcat(y,horzcat(n(i),c(j),unique(c(j+1)),t));
                 else
                     f=horzcat(n(i),c(j),unique(c(j+1)),traveltime_1);
                     y=vertcat(y,f);
                 end
           end
    end
end
           
    

end

