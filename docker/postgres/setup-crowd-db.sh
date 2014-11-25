#!/bin/bash
echo "******CREATING CROWD & CROWDID DATABASE******"
gosu postgres postgres --single <<- EOSQL
  CREATE DATABASE crowd WITH ENCODING 'UNICODE' LC_COLLATE 'C' LC_CTYPE 'C' \
    TEMPLATE template0;
  CREATE DATABASE crowdid WITH ENCODING 'UNICODE' LC_COLLATE 'C' \
    LC_CTYPE 'C' TEMPLATE template0;
  CREATE USER crowd;
  GRANT ALL PRIVILEGES ON DATABASE crowd to crowd;
  GRANT ALL PRIVILEGES ON DATABASE crowdid to crowd;
EOSQL
echo ""

{ echo; echo "host crowd crowd 0.0.0.0/0 trust"; } >> "$PGDATA"/pg_hba.conf
{ echo; echo "host crowdid crowd 0.0.0.0/0 trust"; } >> "$PGDATA"/pg_hba.conf

if [ -r '/tmp/crowd.dump' ]; then
    echo "**IMPORTING CROWD DATABASE BACKUP**"
    gosu postgres postgres &
    PID=$!
    sleep 2
    gosu postgres psql crowd < /tmp/crowd.dump
    kill $PID
    sleep 2
    echo "**CROWD DATABASE BACKUP IMPORTED***"
fi

if [ -r '/tmp/crowdid.dump' ]; then
    echo "**IMPORTING CROWDID DATABASE BACKUP**"
    gosu postgres postgres &
    PID=$!
    sleep 2
    gosu postgres psql crowdid < /tmp/crowdid.dump
    kill $PID
    sleep 2
    echo "**CROWDID DATABASE BACKUP IMPORTED***"
fi

echo "******CROWD & CROWDID DATABASE CREATED******"
