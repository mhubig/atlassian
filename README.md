## Atlassian services

This repository holds a dockerized orchestration of the Atlassian web apps
Jira, Stash and Confluence. To simplify the usermangement Crowd is also
included. For more information on the apps please refere to the offical
Atlassian websites:

- [Jira](https://www.atlassian.com/software/jira)
- [Stash](https://www.atlassian.com/software/stash)
- [Confluence](https://www.atlassian.com/software/confluence)
- [Crowd](https://www.atlassian.com/software/crowd)

### Prerequisites

In order to run this apps you need to make sure you're running at least
[docker 1.3.1](https://docker.com) and [fig 1.0.1](http://fig.sh). For
detailed installation instructions please refere to the origin websites:

  - [http://docs.docker.com/installation](http://docs.docker.com/installation)
  - [http://www.fig.sh/install.html](http://www.fig.sh/install.html)

### Deploy/Update the application

    # rebuild the docker images
    $ fig build

    # restart the docker images
    $ fig up -d

    # inspect the logs
    $ fig logs

If you deploy the apps for the first time you may need to restore the database
from a backup for each app and adapt the database connection settings!

### Debug (aka. go inside) an image

    # execute a bash shell
    $ docker exec -it atlassian_stash_1 bash

### Backup the PostgreSQL data

    # restore the confluence database backup
    $ sudo docker run -it --rm --link atlassian_database_1:db -v $(pwd):/tmp \
        postgres sh -c 'pg_dump --username=confluence -w \
        --host="$DB_PORT_5432_TCP_ADDR" -Fc confluence > /tmp/confluence.bak'

    # restore the stash database backup
    $ sudo docker run -it --rm --link atlassian_database_1:db -v $(pwd):/tmp \
        postgres sh -c 'pg_dump --username=stash -w \
        --host="$DB_PORT_5432_TCP_ADDR" -Fc stash > /tmp/stash.bak'

    # restore the jira database backup
    $ sudo docker run -it --rm --link atlassian_database_1:db -v $(pwd):/tmp \
        postgres sh -c 'pg_dump --username=jira -w \
        --host="$DB_PORT_5432_TCP_ADDR" -Fc jira > /tmp/jira.bak'

    # restore the crowd database backup
    $ sudo docker run -it --rm --link atlassian_database_1:db -v $(pwd):/tmp \
        postgres sh -c 'pg_dump --username=crowd -w \
        --host="$DB_PORT_5432_TCP_ADDR" -Fc crowd > /tmp/crowd.bak'

### Restore the PostgreSQL data

    # restore the confluence database backup
    $ sudo docker run -it --rm --link atlassian_database_1:db -v $(pwd):/tmp \
        postgres sh -c 'pg_restore --username=confluence -w \
        --host="$DB_PORT_5432_TCP_ADDR" -Fc /tmp/confluence.bak'

    # restore the stash database backup
    $ sudo docker run -it --rm --link atlassian_database_1:db -v $(pwd):/tmp \
        postgres sh -c 'pg_restore --username=stash -w \
        --host="$DB_PORT_5432_TCP_ADDR" -Fc /tmp/stash.bak'

    # restore the jira database backup
    $ sudo docker run -it --rm --link atlassian_database_1:db -v $(pwd):/tmp \
        postgres sh -c 'pg_restore --username=jira -w \
        --host="$DB_PORT_5432_TCP_ADDR" -Fc /tmp/jira.bak'

    # restore the crowd database backup
    $ sudo docker run -it --rm --link atlassian_database_1:db -v $(pwd):/tmp \
        postgres sh -c 'pg_restore --username=crowd -w \
        --host="$DB_PORT_5432_TCP_ADDR" -Fc /tmp/crowd.bak'

