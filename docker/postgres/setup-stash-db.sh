#!/bin/bash
echo "******CREATING STASH DATABASE*****"
gosu postgres postgres --single <<- EOSQL
   CREATE DATABASE stash WITH ENCODING 'UNICODE' LC_COLLATE 'C' LC_CTYPE 'C' \
       TEMPLATE template0;
   CREATE USER stash;
   GRANT ALL PRIVILEGES ON DATABASE stash to stash;
EOSQL
echo ""
echo "******STASH DATABASE CREATED******"
