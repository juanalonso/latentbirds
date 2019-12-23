#!/bin/bash

folderIn="../twitter_data"

fileList=(${folderIn}/*.wav)
for file in "${fileList[@]}"
do

    filename="${file%.*}"

    echo "Processing" ${filename}.wav
 
    ffmpeg -v error -y -loop 1  -i ${filename}.png -i ${filename}.wav -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" -c:v libx264 -tune stillimage -c:a aac -b:a 192k -pix_fmt yuv420p -t 4 ${filename}.mp4 

done



