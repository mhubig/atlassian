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
{ echo; echo "host crowd crowd 0.0.0.0/0 trust"; } >> "$PGDATA"/pg_hba.conf
{ echo; echo "host crowdid crowd 0.0.0.0/0 trust"; } >> "$PGDATA"/pg_hba.conf
echo ""
echo "******CROWD & CROWDID DATABASE CREATED******"
