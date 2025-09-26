package de.fitcontrol.fitcontrol.keycloak;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;

import java.security.Principal;
import java.util.Map;


@Slf4j
@RestController
@RequestMapping("/api")
public class DemoRestController {
	@GetMapping("/public")
    public String publicEndpoint() {
        return "============> This is a public endpoint!";
    }

    @GetMapping("/secured")
    public Map<String, String> securedEndpoint(@AuthenticationPrincipal Jwt jwt, Principal principal) {
    	log.atDebug().log("===========> endpoint /secured called.");
        return Map.of(
            "message", "This is a secured endpoint, " + principal.getName() + "!",
            "username", jwt.getClaimAsString("preferred_username"),
            "email", jwt.getClaimAsString("email"),
            "roles", jwt.getClaimAsStringList("realm_access").toString()
        );
    }

    @GetMapping("/admin")
    @PreAuthorize("hasRole('admin')") // Requires 'admin' role in Keycloak
    public String adminEndpoint() {
        return "This is an admin-only endpoint!";
    }
}
