package de.fitcontrol.restapi.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import de.fitcontrol.model.AppUser;
import de.fitcontrol.service.AppUserService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value = "/appuser", produces = { "application/json" })
public class AppUserController {
	
	@Autowired
	private AppUserService appUserService;
	
    @GetMapping("/appuser-info")
    public Optional<AppUser> getUserInfo(Authentication authentication) {

        log.atDebug().log("---------------------- authentication: " + authentication.getDetails().toString());
    	Optional<AppUser> appUser = null;
        if (authentication instanceof JwtAuthenticationToken) {
        	
            JwtAuthenticationToken jwtAuthentication = (JwtAuthenticationToken) authentication;
            Jwt jwt = jwtAuthentication.getToken();

            String userId = jwt.getSubject(); // This is the 'sub' claim from Keycloak
            String username = jwt.getClaimAsString("preferred_username"); // Or 'sub'
            String email = jwt.getClaimAsString("email");
            
            log.atDebug().log("---------------------- authentication instanceof JwtAuthenticationToken: " + username + ", " + email);
            
            // List<String> roles = jwt.getClaimAsStringList("roles"); // If you mapped roles in Keycloak

            // Now you can use userId to look up app-specific data
            // AppUserProfile profile = appUserProfileRepository.findByKeycloakUserId(userId);

            //return "Hello " + username + " (ID: " + userId + ", Email: " + email + ")";
            appUser = appUserService.getUserByUserNameAndEmail(username, email);
        }
        return appUser;
    }
    
    @PutMapping("/change-appuser-info")
    public String changeAppUserInfo(Authentication authentication) {
        if (authentication instanceof JwtAuthenticationToken) {
//TODO
        }
        return "Not authenticated as a Keycloak user.";
    }

}
