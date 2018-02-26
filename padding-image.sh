#!/bin/bash
#  ██████╗ ██████╗ ██████╗ ███████╗███╗   ███╗ █████╗ ███╗   ██╗
# ██╔════╝██╔═══██╗██╔══██╗██╔════╝████╗ ████║██╔══██╗████╗  ██║
# ██║     ██║   ██║██║  ██║█████╗  ██╔████╔██║███████║██╔██╗ ██║
# ██║     ██║   ██║██║  ██║██╔══╝  ██║╚██╔╝██║██╔══██║██║╚██╗██║
# ╚██████╗╚██████╔╝██████╔╝███████╗██║ ╚═╝ ██║██║  ██║██║ ╚████║
#  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝

# apt-get install imagemagick

extension="png"
now="IMAGEMAGICK"
width="200"
height="200"

for image in ~/Desktop/images/*.png;
do
	echo "$image <=> ${image%.*}$now.$extension"
	convert \
	"$image" \
	-background none \
	-gravity center  \
	-extent 200x200 \
	"${image%.*}$now.$extension"

	# Optional
	# rm "$image"
done;

# Cache
rm -rf /tmp/magick-*