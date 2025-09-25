package de.fitcontrol.fitcontrol.keycloak;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.client.WebClient;

import lombok.extern.slf4j.Slf4j;
import reactor.core.publisher.Mono;

record TokenExchangeRequest(String code, String code_verifier, String redirect_uri) {}
record TokenExchangeResponse(String access_token, String expires_in, String refresh_expires_in, String refresh_token, String token_type, String id_token) {}

@Slf4j
@RestController
@RequestMapping("/api/auth")
public class AuthRestController {

    @Value("${spring.security.oauth2.client.registration.keycloak.client-id}")
    private String clientId;

    @Value("${spring.security.oauth2.client.registration.keycloak.client-secret}")
    private String clientSecret;

    @Value("${spring.security.oauth2.client.provider.keycloak.token-uri}")
    private String tokenUri;

    private final WebClient webClient;

    public AuthRestController(WebClient.Builder webClientBuilder) {
        this.webClient = webClientBuilder.build();
    }

    @PostMapping("/token")
    public Mono<ResponseEntity<TokenExchangeResponse>> exchangeToken(@RequestBody TokenExchangeRequest request) {
        log.atDebug().log("===========> endpoint /token called.");
    	MultiValueMap<String, String> formData = new LinkedMultiValueMap<>();
        formData.add("grant_type", "authorization_code");
        formData.add("client_id", clientId);
        formData.add("client_secret", clientSecret);
        formData.add("code", request.code());
        formData.add("code_verifier", request.code_verifier());
        formData.add("redirect_uri", request.redirect_uri()); // Must match the one sent to Keycloak initially

        return webClient.post()
                .uri(tokenUri)
                .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                .body(BodyInserters.fromFormData(formData))
                .retrieve()
                .bodyToMono(TokenExchangeResponse.class)
                .map(ResponseEntity::ok)
                .doOnError(e -> System.err.println("Error exchanging token: " + e.getMessage()));
    }
}
