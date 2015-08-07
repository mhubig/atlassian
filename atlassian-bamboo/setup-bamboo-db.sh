#!/bin/bash
echo "******CREATING CROWD & CROWDID DATABASE******"
gosu postgres postgres --single <<- EOSQL
  CREATE DATABASE bamboo WITH ENCODING 'UNICODE' LC_COLLATE 'C' LC_CTYPE 'C' \
    TEMPLATE template0;
  CREATE USER bamboo;
  GRANT ALL PRIVILEGES ON DATABASE bamboo to bamboo;
EOSQL
echo ""

{ echo; echo "host bamboo bamboo 0.0.0.0/0 trust"; } >> "$PGDATA"/pg_hba.conf

if [ -r '/tmp/dumps/bamboo.dump' ]; then
    echo "**IMPORTING BAMBOO DATABASE BACKUP**"
    gosu postgres postgres &
    SERVER=$!; sleep 2
    gosu postgres psql bamboo < /tmp/dumps/bamboo.dump
    kill $SERVER; wait $SERVER
    echo "**BAMBOO DATABASE BACKUP IMPORTED***"
fi

echo "******BAMBOO DATABASE CREATED******"
