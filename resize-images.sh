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
width="350"

for image in ~/Desktop/images/*.jpg;
# for image in ~/Desktop/images/*.png;
do
	echo "$image <=> ${image%.*}$now.$extension"
	# Crop => -trim
	convert "$image" -quality 95 -resize $width "${image%.*}$now.$extension"
	
	# convert "$image" -gravity center -background transparent -extent 330x330 "${image%.*}$now.$extension"

	# Optional
	# rm "$image"
done;

# Cache
rm -rf /tmp/magick-*