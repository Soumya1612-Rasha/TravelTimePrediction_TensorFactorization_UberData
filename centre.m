%THIS SCRIPT ONLY CREATES A RECORD OF THE COORDINATES OF THE THE CENTRES


centre1=[];
for i=(-122.45+grid_lat/2):grid_lat:(-122.4-grid_lat/2)
    for j=(37.73+grid_lon/2):grid_lon:(37.8-grid_lon/2)
        z=horzcat(i,j);
        centre1=vertcat(centre1,z);
    end
end
