package de.fitcontrol.fitcontrol.config;

import java.util.Arrays;
import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.oauth2.client.oidc.web.logout.OidcClientInitiatedLogoutSuccessHandler;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;



@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
    private final String KEYCLOAK_LOGOUT_URI = "http://localhost:8081/realms/fitcontrol-realm/protocol/openid-connect/logout";
    
    @Autowired
    private ClientRegistrationRepository clientRegistrationRepository;


    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests(authorize -> authorize
                // Allow static resources (if any served directly) and your Angular app can potentially access these
                // For a purely backend-driven auth, you might even make /login/oauth2/** accessible prior auth
                .requestMatchers("/login**", "/oauth2/**", "/callback/**").permitAll() // Allow these paths for the OAuth2 flow
                .anyRequest().authenticated() // All other requests require authentication
            )
            .oauth2Login(oauth2 -> oauth2
                .defaultSuccessUrl("http://localhost:4200/", true) // Redirect to Angular after successful login
                // .authorizationEndpoint(authorization -> authorization.baseUri("/oauth2/authorization")) // Optional: Customize auth endpoint
                // .redirectionEndpoint(redirection -> redirection.baseUri("/login/oauth2/code/*")) // Optional: Customize redirect uri endpoint
            )
            .csrf(csrf -> csrf
                // For SPA, send the CSRF token in a cookie that Angular can read
                .csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse())
                // Ensure CSRF check for POST/PUT/DELETE requests for actual API calls
            )
            .cors(cors -> cors.configurationSource(corsConfigurationSource())) // Enable CORS
            .logout(logout -> logout
                    .logoutSuccessHandler(oidcLogoutSuccessHandler())
                    .invalidateHttpSession(true)
                    .clearAuthentication(true)
                    .deleteCookies("JSESSIONID")
                ); 
        return http.build();
    }

    // Configure CORS for Angular frontend
    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(Collections.singletonList("http://localhost:4200")); // Your Angular frontend URL
        configuration.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "DELETE", "OPTIONS", "HEAD"));
        configuration.setAllowedHeaders(Arrays.asList("Authorization", "Content-Type", "X-Requested-With", "Accept", "X-CSRF-TOKEN"));
        configuration.setAllowCredentials(true); // Allow sending cookies (JSESSIONID, XSRF-TOKEN)
        configuration.setMaxAge(3600L); // How long the pre-flight request can be cached

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration); // Apply this CORS config to all paths
        return source;
    }
    

    @Bean
    public LogoutSuccessHandler oidcLogoutSuccessHandler() {
        OidcClientInitiatedLogoutSuccessHandler oidcLogoutSuccessHandler =
            new OidcClientInitiatedLogoutSuccessHandler(this.clientRegistrationRepository);

        // This is THE URI where Keycloak should redirect *after* it logs out the user
        // from Keycloak itself. This MUST be registered in Keycloak as a valid
        // "Post Logout Redirect URI" for your client.
        oidcLogoutSuccessHandler.setPostLogoutRedirectUri("http://localhost:4200"); // Your Angular app's base URL
System.out.println("--------------- LOGOUT Success handler");
        return oidcLogoutSuccessHandler;
    }
    
    
    /*
    // Logout handler to redirect to Keycloak for full logout
    private LogoutHandler keycloakLogoutHandler() {
        return (request, response, authentication) -> {
            try {
                // Perform local logout first
                new SecurityContextLogoutHandler().logout(request, response, authentication);

                // Redirect to Keycloak's logout endpoint
                // Keycloak will then redirect back to the `post_logout_redirect_uri`
                // if configured in Keycloak client settings, otherwise to Keycloak's login page.
                // For this example, we simply redirect back to Keycloak's logout and let
                // Keycloak handle the final redirection after its session is terminated.
                String redirectUri = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/";
                response.sendRedirect(KEYCLOAK_LOGOUT_URI + "?post_logout_redirect_uri=" + redirectUri);

            } catch (Exception e) {
                System.err.println("Error during Keycloak logout: " + e.getMessage());
            }
        };
    }
    */

}