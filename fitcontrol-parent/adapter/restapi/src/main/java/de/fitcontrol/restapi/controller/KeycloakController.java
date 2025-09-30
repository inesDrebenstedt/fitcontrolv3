package de.fitcontrol.restapi.controller;


import java.security.Principal;
import java.util.Map;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.annotation.RegisteredOAuth2AuthorizedClient;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/userinfo")
public class KeycloakController {
	

    @GetMapping("/user-info")
    public String getUserInfo(Principal principal) {
        if (principal != null) {
            return "Hello, " + principal.getName() + "! You are authenticated.";
        } else {
        	log.atInfo().log("----------Not authenticated.--------->" );
        }
        return "Not authenticated.";
    }
    

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
	

}