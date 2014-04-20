Usage
----------

This image does not require any preconfiguration to run.  To use this image, map a directory from the host to `/var/lib/mysql`.

To run this image:

    /usr/bin/docker run -p 3306:3306 -v /path/to/mariadb/storage:/var/lib/mysql --name=mariadb hachque/mariadb

What do these parameters do?

    -p 3306:3306 = forward the host's 3306 port to MariaDB **IMPORTANT: Read security notice below**
    -v /path/to/mariadb/storage:/var/lib/mysql = map the storage directory for MariaDB
    --name mariadb = the name of the container
    hachque/mariadb = the name of the image

This image is intended to be used in such a way that a new container is created each time it is started, instead of starting and stopping a pre-existing container from this image.  You should configure your service startup so that the container is stopped and removed each time.  A systemd configuration file may look like:

    [Unit]
    Description=MariaDB
    
    [Service]
    ExecStart=<command to start, see above>
    ExecStop=/usr/bin/docker stop mariadb
    ExecStop=/usr/bin/docker rm mariadb
    Restart=always
    RestartSec=5s
    
    [Install]
    WantedBy=multi-user.target

Security Information
----------------------

It is generally **not recommended** to expose your host's 3306 port to the container directly.  If your host is attached to the internet, then this exposes MariaDB's connection to the internet as well.

Instead, you should remove the `-p 3306:3306` parameter and link Docker containers to one another using the `--link` option.  See https://github.com/hach-que-docker/phabricator#usage for an example on how this can be done.

SSH / Login
--------------

**Username:** root

**Password:** linux

