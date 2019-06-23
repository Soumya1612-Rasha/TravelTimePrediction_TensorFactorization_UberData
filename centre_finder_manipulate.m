function [y] = centre_finder_manipulate(x,timestamp)
%The matrix x which is input to the function should be in following format
%TRIPID/TIMESLOT/CENTRE
tripid=x(:,1);
n=unique(tripid);
l=length(n);
y=[];

for i=1:l
    r=x((tripid==n(i)),:);
    time=timestamp(tripid==n(i));%for each trip id
    
    
    if(~isempty(r))%if trip id does not exist
        l=length(r);  
        if(l>1)          
            centres=r(:,3);
            l_c=length(centres);
            j=1;
            k=1;
            while(j<=l_c-1)
                v=[];
                z=[];
                if(j<l_c-1)
                    while(centres(j)==centres(j+1))
                        if(j<l_c-1)
                            v=vertcat(v,j);
                            j=j+1;
                        else
                            break;
                        end
                    end
                end
                v=vertcat(v,j);
                time_1=time(v);
                j=j+1;
                k=j;
                if(k<l_c-1)
                    while(centres(k)==centres(k+1))
                        if(k<l_c-1)
                            z=vertcat(z,k);
                            k=k+1;
                        
                        else
                            break;
                        end
                    
                    end
                end
                z=vertcat(z,k);
                time_2=time(z);
                
                l_1=size(time_1,1);
                l_2=size(time_2,1);
                t=[];
                if(l_1==1 & l_2==1)
                    t=seconds(time_1-time_2);
                else
                    for a=1:l_1
                        for s=1:l_2
                            t_1=seconds(time_1(a)-time(s));
                            t=vertcat(t,t_1);
                        end
                    end
                end
                travel_time=sum(t)/length(t);
                f=horzcat(n(i),centres(j-1),centres(j),travel_time);
                y=vertcat(y,f);
            end
        end
    end
end
end
           
    
           

