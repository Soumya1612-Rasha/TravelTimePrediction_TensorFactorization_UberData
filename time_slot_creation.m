function [timedata] = time_slot_creation(timestamp)
%This functions take the cell array of timestamp and returns the timeslots 
timestamp1=datetime(timestamp,'InputFormat','yyyy-MM-dd''T''HH:mm:ss''+''00:00');
timedata=timestamp1-datetime([2007 01 01 00 00 00]);
timedata=ceil(timedata);
end

