#!/bin/bash

if [ ! -s "$1" ];
then
  echo "Error: the file does not exist or is empty"
  exit 1
fi

new_file="sort_names.txt"
touch "$new_file"

declare -a names_ages=()

while IFS=',' read -r name age;
do
  names_ages+=("$name,$age")
done < "$1"

names_ages_sort=($(printf '%s\n' "${names_ages[@]}" | sort))

for name_age in "${names_ages_sort[@]}";
do
  echo "$name_age" >> "$new_file"
done

echo "The names and ages were sort successfully"