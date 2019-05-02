#!/bin/bash

# Run every mp4 file in folder through framer.sh
for mp4_file in *.MP4
do
	# Reorder GoPro filename to be sequential
	# (use 00 for first file if old GoPro format (Hero5 or earlier)
	if [ ${mp4_file:2:2} == "PR"]
	then
		output_path="GP${mp4_file:4:4}_00"
	else
		output_path="GP${mp4_file:4:4}_${mp4_file:2:2}"
	fi
	
	# Run framer.sh
	echo "Processing $mp4_file (to ${output_path})"
	~/Github/framer/framer.sh -f edges -t tif -i "$mp4_file" -o "$output_path"
done