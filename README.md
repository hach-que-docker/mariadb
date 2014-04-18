Usage
----------

To run this image:

    docker run -d -p localhost:3306:3306 -v path/to/store/mysql/data:/var/lib/mysql hachque/mariadb

What do these parameters do?

    -d = detach from tty
    -p localhost:3306:3306 = map mariadb port to the host
    -v path/to/store/mysql/data:/var/lib/mysql = map the folder for mariadb storage
    hachque/mariadb = the name of the image

SSH / Login
--------------

**Username:** root

**Password:** linux

