#!/bin/bash
PAGEWIDTH=2475
PAGEHEIGHT=3225
HMARGIN=64
VMARGIN=64
W=$((${PAGEWIDTH} - ${HMARGIN} * 2 ))
H=$((${PAGEHEIGHT} - ${VMARGIN} * 2 ))

#/opt/imagemagick-6.9/bin/convert 
for f in ./raw_images/*.jpeg
do
    filename=$(basename "$f")
    extension="${filename##*.}"
    fileiso="${filename%.*}"
    rarename="./rare_images/${fileiso}_rare.jpeg"
    echo "convert $f to $rarename"

    convert -resize "${W}x${H}" \
               -background white \
               -extent "${PAGEWIDTH}x${PAGEHEIGHT}" \
               -gravity center \
               -units PixelsPerInch -density 300x300 \
               $f $rarename
done
# Concatenate all images into a single pdf
convert ./rare_images/*.jpeg ./output/test_jpeg2pdf.pdf