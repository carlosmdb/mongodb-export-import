# Export/Import MongoDB Databases

These scripts automate exporting all database and collections from a MongoDB instance.

## Generic Steps

This assumes you already have all the MongoDB tools installed (mongosh, mongoexport, mongoimport).

Set _MONGODB_URI_ environment variable to enter a valid MongoDB URI (make sure the user has enough privileges either for exporting the data or importing the data)

## Export MongoDB Data

Set _SKIP_DATABASES_ environment variable to define which databases you do not want to export.

Set _FOLDER_ environment variable to change the default folder.
Run the script:

```bash
./exportAllDatabases.sh
```

## Import MongoDB Data

Edit the _FOLDER_ variable to change the default folder where the files will be imported from.

IMPORTANT: it assumes all the files are valid MongoDB data files (created using the _mongoimport_ tool).

Run the script:

```bash
./importAllDatabases.sh
```

## Disclaimer

The code within this repository comes with no guarantee, the use of this code is your responsibility.

I take NO responsibility and/or liability for how you choose to use any of the source code available here. By using any of the files available in this repository, you understand that you are AGREEING TO USE AT YOUR OWN RISK. Once again, ALL files available here are for EDUCATION and/or RESEARCH purposes ONLY.
