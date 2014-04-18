FROM hachque/systemd-none

# Install requirements
RUN zypper --non-interactive in mariadb

# Expose MariaDB on port 3306
EXPOSE 3306

# Add files
ADD 25-mariadb /etc/init.simple/25-mariadb

# Set /init as the default
CMD ["/init"]
