package de.fitcontrol.restapi.controller;


import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.annotation.RegisteredOAuth2AuthorizedClient;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
//@RequestMapping("/api/auth")
public class KeycloakController {
	
    @Value("${keycloak.auth-server-url}")
    private String keycloakAuthServerUrl;

    @Value("${keycloak.realm}")
    private String keycloakRealm;

    @Value("${app.angular-logout-redirect-uri}")
    private String angularLogoutRedirectUri;
    
    @PostMapping("/logout")
    public ResponseEntity<?> logout(HttpServletRequest request,
    		HttpServletResponse response,
    		Authentication authentication) throws IOException {
        log.atDebug().log("---------------- LOGOUT CALLED");
    	String idTokenHint = null;

        if (authentication != null && authentication.getPrincipal() instanceof Jwt) {
            Jwt jwt = (Jwt) authentication.getPrincipal();
            // The 'sub' claim is usually the user ID, 'jti' is the JWT ID.
            // For id_token_hint, Keycloak usually expects the actual ID Token string.
            // If you only have the access token via Authentication object, you might need
            // to store the ID Token on the client side (Angular) and send it with the logout request.
            // For simplicity, if id_token_hint is not critical for your Keycloak version/config, you can omit it.
            // Or get it from a cookie if Keycloak stores it there for web apps.
            // For resource servers, it's common not to have the ID Token directly on the server.
            // A more robust way: Angular sends the id_token itself to this endpoint.
            // For now, let's assume we don't have it on the backend, or it's not strictly required.
            // If needed, Angular should pass it in the body/header.
            // Example: idTokenHint = jwt.getTokenValue(); // This would be the access token, not ID token.
            // It's generally better to use the ID token specifically for logout.
        }

        // Construct Keycloak's end session endpoint URL
        String keycloakLogoutUrl = String.format("%s/realms/%s/protocol/openid-connect/logout",
                keycloakAuthServerUrl, keycloakRealm);

        // Add post_logout_redirect_uri
        keycloakLogoutUrl += "?post_logout_redirect_uri=" + URLEncoder.encode(angularLogoutRedirectUri, StandardCharsets.UTF_8.toString());

        // Add id_token_hint if available and desired
        // if (idTokenHint != null) {
        //     keycloakLogoutUrl += "&id_token_hint=" + URLEncoder.encode(idTokenHint, StandardCharsets.UTF_8.toString());
        // }

        // Perform any server-side cleanup if necessary (e.g., invalidate HttpSession if used)
        // If your Spring Boot app is purely stateless (only validates JWTs),
        // there's no server-side session to invalidate.
        if (request.getSession(false) != null) {
            request.getSession(false).invalidate(); // Invalidate Spring's HttpSession if it exists
        }

        // Send a redirect to the client's browser
        response.sendRedirect(keycloakLogoutUrl);
        return new ResponseEntity<>(HttpStatus.OK); // Or HttpStatus.FOUND to be more explicit for redirect
    }
	
    @GetMapping("/user-info")
    public Map<String, Object> getUserInfo(Authentication authentication) {
        if (authentication != null && authentication.getPrincipal() instanceof Jwt jwt) {
            Map<String, Object> claims = new HashMap<>(jwt.getClaims());
            return claims;
        }

        return Map.of("error", "Not authenticated");
    }
    
    
    @GetMapping("/oauth2-user-info")
    public String getOAuth2UserInfo(@AuthenticationPrincipal OAuth2User oauth2User) {
        if (oauth2User != null) {
            // The attributes map contains claims from the ID token or user info endpoint
            Map<String, Object> attributes = oauth2User.getAttributes();
            log.atInfo().log("----------user info--------->" + attributes.get("preferred_username") );
            return "Hello, " + attributes.get("preferred_username") + "! Your email is " + attributes.get("email");
        }
        return "OAuth2 user not found.";
    }

    // Example of getting full token details (for debugging/advanced use)
    @GetMapping("/token-info")
    public String getTokenInfo(@RegisteredOAuth2AuthorizedClient("keycloak") OAuth2AuthorizedClient authorizedClient) {
        if (authorizedClient != null) {
            return "Access Token: " + authorizedClient.getAccessToken().getTokenValue() +
                   "\nRefresh Token: " + (authorizedClient.getRefreshToken() != null ? authorizedClient.getRefreshToken().getTokenValue() : "N/A");
        }
        return "No token information.";
    }
    
}