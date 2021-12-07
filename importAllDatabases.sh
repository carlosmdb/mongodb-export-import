#!/bin/bash

MONGODB_URI="mongodb+srv://<username>:<password>@<host>"
FOLDER="data"

for file in ${FOLDER}/*; do
  filename=$(basename "$file")
  printf "Importing file $filename...\n"

  IFS='.' read -ra namespace <<<"$filename"
  database=${namespace[0]}
  collection=${namespace[1]}

  result=$(mongoimport --uri="$MONGODB_URI/$database" --collection="${collection}" --file="${FOLDER}/${filename}")

  printf "Done!\n"
done
