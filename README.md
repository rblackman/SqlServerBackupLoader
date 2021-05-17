# Docker Backup Explorer

Load a SQL server backup and expose it as a database.

## Preparation

Copy your .bak file into this directory.

## Build

```bash
docker build -t your-image-name:latest \
    --build-arg  password=YOUR_PW \
    --build-arg  database=YOUR_DB_NAME \
    --build-arg  backup=YOUR_BACKUP.bak \
    .
```
