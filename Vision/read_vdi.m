function depth_array = read_vdi( name )
% read depth array (elements are unsigned 16 bit ints, with 0 as no value

fid = fopen( name, 'r' );
depth_array = fread( fid, [640,480], 'uint16' );
fclose( fid );
