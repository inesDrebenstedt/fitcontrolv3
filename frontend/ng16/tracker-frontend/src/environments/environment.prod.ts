export const old_environment = {
  production: true,
  apiUrl: '/fitcontrol/tracker'
};

export const environment = {
  production: false,
  keycloakConfig: {
    url: 'http://localhost:8081/realms/fitcontrol/protocol/openid-connect/auth',
    realm: 'fitcontrol-realm',
    clientId: 'fitcontrol-frontend'
  },
  backendUrl: 'http://localhost:8083/fitcontrol/tracker' // Your Spring Boot backend URL
};
