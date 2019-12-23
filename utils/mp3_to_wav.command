#!/bin/bash

artist="birds"
clipDuration=4
samplingRate=22050
shortName="song"
overlap=2
baseFolder="../data"

while getopts a:d:r:n:o:f: option
do
    case "${option}"
        in
        a) artist=${OPTARG};;
        d) clipDuration=${OPTARG};;
        r) samplingRate=${OPTARG};;
        n) shortName=${OPTARG};;
        o) overlap=${OPTARG};;
        f) baseFolder=${OPTARG};;
    esac
done

folderIn="${baseFolder}/mp3/${artist}"
folderOut="${baseFolder}/wav/${artist}"

counter=0

mkdir -p $folderOut
    
echo "Sampling rate: ${samplingRate}Hz"
echo "   Block size: $clipDuration seconds"
echo "      Overlap: $overlap seconds"

clipDurationAdjusted=$(($clipDuration - $overlap))

fileList=(${folderIn}/*.mp3)
for file in "${fileList[@]}"
do
    
    echo
    echo " Audio source:" ${file}

    ffmpeg -v error -y -i "${file}" -ac 1 -ar $samplingRate $folderOut/${shortName}.wav
    
    fileDuration=$(ffprobe -i $folderOut/${shortName}.wav -show_entries format=duration -v quiet -of csv="p=0")
    fileDuration=${fileDuration%.*}
    clips=$(echo "$fileDuration / $clipDurationAdjusted" | bc)
    
    echo " Audio lenght:" $fileDuration
    #echo "        Clips:" $clips 

    end=$clipDuration
    clip=0
    while [ $end -le $fileDuration ];
    do
        printf -v pfCounter "%06d" $counter
        echo -n -e "\r   Generating:" $folderOut/${shortName}_${pfCounter}.wav
        ffmpeg -v error -y -i $folderOut/${shortName}.wav -ss $(($clip * $clipDurationAdjusted)) -t $clipDuration $folderOut/${shortName}_${pfCounter}.wav
        counter=$((counter+1))
        clip=$((clip+1))
        end=$((end+clipDurationAdjusted))
    done

    rm $folderOut/${shortName}.wav

    echo
done