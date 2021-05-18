a="RESTORE DATABASE ${DB} FROM DISK = N"
b="'"
c="${BACKUP_PATH}/${BACKUP}"
d="' WITH FILE = 1, MOVE N'"
e="${DB}"
f="' TO N'"
g="${DATA_PATH}/${DB}"
h=".mdf', MOVE N'"
i="${DB}_log"
j="' TO N'"
k="${DATA_PATH}/${DB}"
l="_log.ldf', NOUNLOAD, STATS = 5"
sc="${a}${b}${c}${d}${e}${f}${g}${h}${i}${j}${k}${l}"
# wait for the SQL Server to come up
/bin/echo "Sleeping for ${SLEEP} seconds"
/bin/sleep ${SLEEP}

/opt/mssql-tools/bin/sqlcmd -S . -U SA -P ${SA_PASSWORD} -Q "${sc}"
