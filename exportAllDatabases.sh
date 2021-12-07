#!/bin/bash

MONGODB_URI="mongodb+srv://<username>:<password>@<host>"
SKIP_DATABASES=("__realm_sync" "admin" "config" "local")

DATABASES=$(mongosh "$MONGODB_URI/test" --quiet --eval "show databases" | sed 's/ .*//')

for database in $DATABASES; do

  if [[ " ${SKIP_DATABASES[*]} " =~ " ${database} " ]]; then
    printf "Skip $database database\n"
  fi

  if [[ ! " ${SKIP_DATABASES[*]} " =~ " ${database} " ]]; then
    printf "Exporting $database database...\n"

    COLLECTIONS=$(mongosh "$MONGODB_URI/$database" --quiet --eval "show collections" | sed 's/ .*//')
    for coll in $COLLECTIONS; do
      printf "Exporting $coll collection...\n"
      result=$(mongoexport --uri="$MONGODB_URI/$database" -c "$coll" -o "$database.$coll".json)
      printf "Done!\n"
    done
  fi
done
