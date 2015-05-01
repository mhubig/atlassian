## Atlassian crowd

This is the source for the automated build of the trusted `mhubig/atlassian-crowd`
image. For more Informations on the webapp please refere to the offical Atlassian crowd
[website][1].

### Prerequisites

In order to use this image you need at least [docker 1.6.0][2] and [docker-compose 1.2.0][3].

### Run the application

    # rebuild the docker images
    $ docker-compose build

    # restart the docker images
    $ docker-compose up -d

    # inspect the logs
    $ docker-compose logs

If you deploy the app for the first time you may need to restore the database from a backup!

### Debug (aka. go inside) an image

    # execute a bash shell
    $ docker exec -it atlassiancrowd_crowd_1 bash

---
[1]: https://www.atlassian.com/software/crowd
[2]: https://docs.docker.com/installation
[3]: https://docs.docker.com/compose
