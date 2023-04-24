#!/bin/bash
# script to move and rename files with a space in its names in a new directory
if [ $# -ne 2 ];
then
  echo "Error: You must introduce the directory name and the new directory name"
  exit 1
fi

directory=$1

if [ ! -d "$directory" ] || [ -z "$(ls $directory/*.txt 2>/dev/null)" ];
then
  echo "Error: The directory doesn't exist or it does not contain any text files"
  exit 1
fi

new_directory=$2
mkdir "$new_directory"

for file in $directory/*.txt;
do
  file_name=$(basename "$file")
  new_name=$(echo "$file_name" | tr ' ' '_')
  mv "$file" "$new_directory/$new_name"
done

echo "The files were moved and renamed successfully"