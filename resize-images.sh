#!/bin/bash
#  ██████╗ ██████╗ ██████╗ ███████╗███╗   ███╗ █████╗ ███╗   ██╗
# ██╔════╝██╔═══██╗██╔══██╗██╔════╝████╗ ████║██╔══██╗████╗  ██║
# ██║     ██║   ██║██║  ██║█████╗  ██╔████╔██║███████║██╔██╗ ██║
# ██║     ██║   ██║██║  ██║██╔══╝  ██║╚██╔╝██║██╔══██║██║╚██╗██║
# ╚██████╗╚██████╔╝██████╔╝███████╗██║ ╚═╝ ██║██║  ██║██║ ╚████║
#  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝

# apt-get install imagemagick

extension="jpg"
now="IMAGEMAGICK"
width="1024"

for image in ~/Desktop/images/*.jpg;
do
	echo "$image"" <=> ""${image%.*}$now.$extension"
	convert "$image" -quality 100 -resize $width "${image%.*}$now.$extension"

	# Optional
	rm "$image"
done;

# Cache
rm -rf /tmp/magick-*