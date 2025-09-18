POSTGRES_PASSWORD=password
POSTGRES_DB=fitcontrol-keycloak-DB
POSTGRES_USER=keycloak
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/postgresql/16/bin
GOSU_VERSION=1.17
LANG=en_US.utf8
PG_MAJOR=16
PG_VERSION=16.10-1.pgdg13+1
PGDATA=/var/lib/postgresql/data

docker run -d --name new-fitcontrol-keycloak -p 8081:8080 -e KC_DB=postgres -e KC_DB_URL_HOST=fitcontrol-keycloak-postgres -e KC_DB_URL_DATABASE=fitcontrol-keycloak-DB -e KC_DB_USERNAME=keycloak -e KC_DB_PASSWORD=password -e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=admin --network bridge fitcontrolkeycloak start-dev