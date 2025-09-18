FROM quay.io/keycloak/keycloak:latest
# docker build -t fitcontrolkeycloak .
# docker run -d --name fitcontrol-keycloak -p 8081:8080 fitcontrolkeycloak
# docker run -d --name fitcontrol-keycloak -p 8081:8080 -e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=admin -v C:\Users\InesDrebenstedt\Documents\knowledgebase\Projekte\wt\fitcontrolv3\fitcontrol-parent\fitcontrol\target\fitcontrol-1.0-SNAPSHOT.jar:/opt/keycloak/providers/fitcontrol-1.0-SNAPSHOT.jar -v keycloak_data:/opt/keycloak/data quay.io/keycloak/keycloak:latest start-dev
# docker run -d --name new-fitcontrol-keycloak -p 8081:8080 -e KC_DB=postgres -e KC_DB_URL_HOST=fitcontrol-keycloak-postgres -e KC_DB_URL_DATABASE=keycloak -e KC_DB_USERNAME=keycloak -e KC_DB_PASSWORD=supersecret -e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=admin --network bridge fitcontrolkeycloak start-dev


# visit http://127.0.0.1:8081

# Set environment variables for the Keycloak admin user
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Set the default command to run Keycloak in dev mode
CMD ["start-dev"]
