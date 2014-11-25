#!/bin/bash
echo "******CREATING JIRA DATABASE******"
gosu postgres postgres --single <<- EOSQL
   CREATE DATABASE jira WITH ENCODING 'UNICODE' LC_COLLATE 'C' LC_CTYPE 'C' \
       TEMPLATE template0;
   CREATE USER jira;
   GRANT ALL PRIVILEGES ON DATABASE jira to jira;
EOSQL
echo ""

{ echo; echo "host jira jira 0.0.0.0/0 trust"; } >> "$PGDATA"/pg_hba.conf

echo "******JIRA DATABASE CREATED******"
