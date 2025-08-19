package de.fitcontrol.restapi.controller;


import java.io.IOException;
import java.security.Principal;
import java.util.Map;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.annotation.RegisteredOAuth2AuthorizedClient;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.annotation.RegisteredOAuth2AuthorizedClient;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("/api")
public class KeycloakController {
	

    @GetMapping("/user-info")
    public String getUserInfo(Principal principal) {
        if (principal != null) {
        	System.out.println("------------------->" + principal.getName());
            return "Hello, " + principal.getName() + "! You are authenticated.";
        } else {
        	System.out.println("----------Not authenticated.--------->" );
        }
        return "Not authenticated.";
    }
    
/*
@GetMapping("/logout")
public void logout(HttpServletRequest request,
                   HttpServletResponse response,
                   Authentication authentication,
                   @RegisteredOAuth2AuthorizedClient("keycloak") OAuth2AuthorizedClient authorizedClient) throws IOException {
	System.out.println("----------WTF------------->" );
    new SecurityContextLogoutHandler().logout(request, response, authentication);

    //String idToken = authorizedClient.getAccessToken().getTokenValue(); // Not ideal, try to get actual ID token if possible

    // Ideally get ID token, not access token, depending on your config:
    String idToken = ((OidcUser) authentication.getPrincipal()).getIdToken().getTokenValue();

    String redirectUri = "http://localhost:4200"; // Or wherever you want
    String logoutUrl = "http://localhost:8081/realms/fitcontrol/protocol/openid-connect/logout" +
                       "?id_token_hint=" + idToken +
                       "&post_logout_redirect_uri=" + redirectUri;
    
    System.out.println("----------logoutUrl------------->" + logoutUrl);

    response.sendRedirect(logoutUrl);
}
*/

    @GetMapping("/oauth2-user-info")
    public String getOAuth2UserInfo(@AuthenticationPrincipal OAuth2User oauth2User) {
        if (oauth2User != null) {
            // The attributes map contains claims from the ID token or user info endpoint
            Map<String, Object> attributes = oauth2User.getAttributes();
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
	
/*
    @GetMapping("/")
    public String home() {
        return "<h1>Welcome to the Home Page!</h1><p><a href='/public'>Public Page</a></p><p><a href='/private'>Private Page</a></p><p><a href='/admin'>Admin Page</a></p><p><a href='/logout'>Logout</a></p>";
    }

    @GetMapping("/public")
    public String publicPage() {
        return "<h1>This is a public page. Anyone can see this.</h1><p><a href='/'>Home</a></p>";
    }

    @GetMapping("/private")
    public String privatePage(Principal principal) {
        String username = (principal != null) ? principal.getName() : "Guest";
        return "<h1>Hello, " + username + "! This is a private page.</h1><p>You must be logged in to see this.</p>" +
               "<p><a href='/'>Home</a></p>";
    }

    @GetMapping("/admin")
    public String adminPage(@AuthenticationPrincipal OidcUser oidcUser) {
        String username = oidcUser.getPreferredUsername();
        String email = oidcUser.getEmail();
        Map<String, Object> claims = oidcUser.getClaims();

        return "<h1>Hello, Admin " + username + "! This is the admin page.</h1>" +
               "<p>Email: " + email + "</p>" +
               "<p>All Claims: " + claims + "</p>" +
               "<p><a href='/'>Home</a></p>";
    }
    */
}