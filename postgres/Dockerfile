FROM postgres:9.6

# Set PGDATA do a different location so it won't be persisted

ENV PGDATA /home/data
ENV POSTGRES_DB fhcomplete
ENV POSTGRES_USER admin
ENV POSTGRES_PASSWORD password
ENV PGPASSWORD password
ENV PGUSER admin

COPY demodb.sql /docker-entrypoint-initdb.d/demodb.sql
