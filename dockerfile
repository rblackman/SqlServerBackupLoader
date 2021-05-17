ARG password
ARG database
ARG backup
ARG sleep=30

FROM mcr.microsoft.com/mssql/server:2019-CU10-ubuntu-20.04 as base

ARG password
ARG database
ARG backup
ARG sleep

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=${password}
ENV MSSQL_SA_PASSWORD=${password}
ENV DB=${database}
ENV BACKUP=${backup}
ENV SLEEP=${sleep}

ENV DATA_PATH=/var/opt/mssql/data
ENV BACKUP_PATH=/var/opt/mssql/backup

# Create work directory
RUN mkdir -p /usr/work
WORKDIR /usr/work

# Copy all scripts into working directory
COPY ./import-data.sh /usr/work/
COPY ./entrypoint.sh /usr/work/

RUN mkdir -p "${DATA_PATH}" && mkdir -p "${BACKUP_PATH}"
VOLUME [ "${DATA_PATH}", "${BACKUP_PATH}" ]

COPY ${BACKUP} ${BACKUP_PATH}

HEALTHCHECK --interval=10s --timeout=5s --start-period=10s --retries=10 \
    CMD /opt/mssql-tools/bin/sqlcmd -S . -U sa -P ${SA_PASSWORD} -Q "select 0;" || exit 1

EXPOSE 1433

CMD /bin/bash ./entrypoint.sh
