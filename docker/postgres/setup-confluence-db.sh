#!/bin/bash
echo "******CREATING CONFLUENCE DATABASE******"
gosu postgres postgres --single <<- EOSQL
   CREATE DATABASE confluence WITH ENCODING 'UNICODE' LC_COLLATE 'C' \
       LC_CTYPE 'C' TEMPLATE template0;
   CREATE USER confluence;
   GRANT ALL PRIVILEGES ON DATABASE confluence to confluence;
EOSQL
echo ""
echo "******CONFLUENCE DATABASE CREATED******"
