#! /bin/bash

itunes_home=~/Desktop
library=Library.xml
image_home=~/Desktop/AlbumArtwork
exclude="Automatically Add to Music|Downloads-Music"

# Check to see if give iTunes directory exists
if [ ! -d $itunes_home ]
then
  echo No source directory.
  exit 1
fi

# Check to see if give iTunes Library.xml (or whatever) exists
if [ ! -f ${itunes_home}/${library} ]
then
  echo No source file.
  exit 1
fi

# Check to see if give image directory exists
if [ ! -d $image_home ]
then
  echo No image directory - creating
  mkdir $image_home
fi

# Populate image directory based on contents of iTunes Library
cat ${itunes_home}/${library} | grep "<key>Album Artist" | cut -d\> -f4 | sed -e"s/^The //" | sed -e"s/#38;//" | cut -d\< -f1 | \
  tr '[:upper:]' '[:lower:]' | tr ' ' '_' | sort -u | while read list
do
  # Create first level of folders
  initial=$(echo $list | cut -c1)
  mkdir -p ${image_home}/${initial}/"${list}"
done
