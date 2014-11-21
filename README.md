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

    # backup the joomla database
    $ docker run -it --rm --link homepage_database_1:mysql -v $(pwd):/tmp \
       mysql sh -c 'mysqldump  -h"$MYSQL_PORT_3306_TCP_ADDR" -uroot \
       -P"$MYSQL_PORT_3306_TCP_PORT" -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD" \
       joomla > /tmp/backup.sql'

### Restore the PostgreSQL data

    # restore the joomla database backup
    $ docker run -it --rm --link homepage_database_1:mysql -v $(pwd):/tmp \
       mysql sh -c 'mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -uroot \
       -P"$MYSQL_PORT_3306_TCP_PORT" -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD" \
       joomla < /tmp/backup.sql'

