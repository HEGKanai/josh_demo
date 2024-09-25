FROM postgres:13

ENV POSTGRES_DB=mydatabase
ENV POSTGRES_USER=myuser
ENV POSTGRES_PASSWORD=secret

COPY init.sql /docker-entrypoint-initdb.d/