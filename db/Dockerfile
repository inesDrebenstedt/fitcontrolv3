# Use the official MariaDB image as the base
FROM mariadb:latest

# Set environment variables (optional, you can also pass these at runtime)
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=fitcontroldb
ENV MYSQL_PASSWORD=root

# Copy any custom configuration files if you have them
# COPY my-custom.cnf /etc/mysql/conf.d/

# Expose the default MariaDB port
EXPOSE 3306

# The official MariaDB image has an ENTRYPOINT and CMD set, so you don't need to override it unless necessary.
