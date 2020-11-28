FROM postgres:12

COPY create_frege_db.sql /docker-entrypoint-initdb.d
