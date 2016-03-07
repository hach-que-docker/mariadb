FROM hachque/systemd-none

# Remove boot patching
RUN rm /etc/init.simple/00-patch

# Update images
RUN zypper --non-interactive up --force-resolution || true
RUN zypper --non-interactive up --force-resolution || true

# Add server-database
RUN zypper --non-interactive ar -G -f http://download.opensuse.org/repositories/server:/database/openSUSE_13.1/ server-database
RUN zypper --non-interactive ref

# Install requirements
RUN zypper --non-interactive in --force-resolution mariadb

# Add users to /etc/passwd and /etc/group
RUN echo "mysql:x:60:495:MariaDB daemon:/var/lib/mysql:/bin/false" >> /etc/passwd
RUN echo "mysql:x:495:" >> /etc/group

# Expose MariaDB on port 3306
EXPOSE 3306

# Add files
ADD 25-mariadb /etc/init.simple/25-mariadb

# Set /init as the default
CMD ["/init"]
