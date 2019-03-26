#!/bin/bash
#  ██████╗ ██████╗ ██████╗ ███████╗███╗   ███╗ █████╗ ███╗   ██╗
# ██╔════╝██╔═══██╗██╔══██╗██╔════╝████╗ ████║██╔══██╗████╗  ██║
# ██║     ██║   ██║██║  ██║█████╗  ██╔████╔██║███████║██╔██╗ ██║
# ██║     ██║   ██║██║  ██║██╔══╝  ██║╚██╔╝██║██╔══██║██║╚██╗██║
# ╚██████╗╚██████╔╝██████╔╝███████╗██║ ╚═╝ ██║██║  ██║██║ ╚████║
#  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝

# apt-get install imagemagick

extension="jpg"
# extension="png"
now="IMAGEMAGICK"
width="1200"

for folder in ~/Desktop/images/*;
# for image in ~/Desktop/images/*.png;
do
	# echo "$folder"
	for image in $folder/gallery/*.jpg;
	do
		if [ -e "$image" ]; then
			echo -e "$image\n"
			convert "$image" -quality 95 -resize $width "${image%.*}.$extension"
			# rm "$image"
		fi
	done;

	for image in $folder/logo/*.jpg;
	do
		if [ -e "$image" ]; then
			echo -e "$image\n"
			convert "$image" -quality 95 "${image%.*}.$extension"
			# rm "$image"
		fi
	done;

	for image in $folder/gallery/*.jpeg;
	do
		if [ -e "$image" ]; then
			echo -e "$image\n"
			convert "$image" -quality 95 -resize $width "${image%.*}.$extension"
			rm "$image"
		fi
	done;

	for image in $folder/logo/*.jpeg;
	do
		if [ -e "$image" ]; then
			echo -e "$image\n"
			convert "$image" -quality 95 "${image%.*}.$extension"
			rm "$image"
		fi
	done;

	for image in $folder/gallery/*.png;
	do
		if [ -e "$image" ]; then
			echo -e "$image\n"
			convert "$image" -quality 95 -resize $width "${image%.*}.$extension"
			rm "$image"
		fi
	done;

	for image in $folder/logo/*.png;
	do
		if [ -e "$image" ]; then
			echo -e "$image\n"
			convert "$image" -quality 95 "${image%.*}.$extension"
			rm "$image"
		fi
	done;

	# for image in $folder/logo/*.png;
	# do
	# 	echo -e "$image\n"
	# 	convert "${image%.*}.$extension" -quality 95 "${image%.*}.$extension"
	# 	# rm "$image"
	# done;
	# echo "$image <=> ${image%.*}$now.$extension"
	# Crop => -trim
	# convert "$image" -quality 95 -resize $width "${image%.*}$now.$extension"
	#  convert "$image" -blur 0x2 "${image%.*}$now.$extension"
	# convert "$image" -blur 0x2 "${image%.*}-blur.$extension"
	
	#convert "$image" -gravity center -background transparent -extent 330x330 "${image%.*}$now.$extension"
	
	#  This command resizes to a specific size
	#convert "$image" -gravity center -extent 1100x700 "${image%.*}$now.$extension"

	#	This command lowers the weight of an image by approximately 30% without losing the quality	
	#convert "$image" -sampling-factor 4:2:0 -strip -quality 80 -interlace JPEG -colorspace sRGB "${image%.*}$now.$extension"

	# Optional
	# rm "$image"
done;

# Cache
rm -rf /tmp/magick-*