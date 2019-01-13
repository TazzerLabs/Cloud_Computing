# MySQL Docker file
FROM mysql:5.7.23

# Set root password to password and DB as minibank
ENV MYSQL_ROOT_PASSWORD=password
ENV MYSQL_DATABASE=minibank

# Add the db sql file and docker entry
ADD db.sql docker-entrypoint-initdb.d
