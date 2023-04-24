#!/bin/bash
if [ $# -eq 0 ];
then
  echo "Error: you must specify then file with URLs"
  exit 1
fi

if [ ! -s "$1" ];
then
  echo "Error: the file does not exist or is empty"
  exit 1
fi

new_directory="files_downloaded"
mkdir "$new_directory"

while read url; do
  file_name=$(basename "$url")
  wget -O "$new_directory/$file_name" "$url"
done < "$1"

echo "The files were downloaded and stored successfully"