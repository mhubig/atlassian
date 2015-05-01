#!/bin/bash
echo "******CREATING STASH DATABASE*****"
gosu postgres postgres --single <<- EOSQL
   CREATE DATABASE stash WITH ENCODING 'UNICODE' LC_COLLATE 'C' LC_CTYPE 'C' \
       TEMPLATE template0;
   CREATE USER stash;
   GRANT ALL PRIVILEGES ON DATABASE stash to stash;
EOSQL
echo ""

{ echo; echo "host stash stash 0.0.0.0/0 trust"; } >> "$PGDATA"/pg_hba.conf

if [ -r '/tmp/dumps/stash.dump' ]; then
    echo "**IMPORTING STASH DATABASE BACKUP**"
    gosu postgres postgres &
    SERVER=$!; sleep 2
    gosu postgres psql stash < /tmp/dumps/stash.dump
    kill $SERVER; wait $SERVER
    echo "**STASH DATABASE BACKUP IMPORTED***"
fi

echo "******STASH DATABASE CREATED******"
