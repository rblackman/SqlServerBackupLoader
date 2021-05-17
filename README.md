# Docker Backup Explorer

Load a SQL server backup and expose it as a database.

## Preparation

Copy your .bak file into this directory.

## Build

```bash
docker build \
    --tag your-image-name:latest \
    --build-arg  password=YOUR_PW \
    --build-arg  database=YOUR_DB_NAME \
    --build-arg  backup=YOUR_BACKUP.bak \
    .
```

### Automating Build

You can automate your build by modifying the example script.

```bash
#!/bin/bash

docker build \
    --tag your-app-sql:latest \
    --build-arg password=SUPERSECRETPASSWORD \
    --build-arg database=YourDBName \
    --build-arg backup=db.bak \
    .

```

## Using Image Example

```bash
docker run --name my-sql-backup -p:1433:1433 -it my-image:latest
```
