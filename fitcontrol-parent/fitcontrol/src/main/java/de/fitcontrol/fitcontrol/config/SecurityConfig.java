package de.fitcontrol.fitcontrol.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;


@Configuration
@EnableWebSecurity
public class SecurityConfig {


    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests(authorize -> authorize
                .requestMatchers("/**").permitAll() // Public endpoints
                .anyRequest().permitAll()
            )
            .csrf().disable()
            .formLogin().disable() // Disable form login
            .httpBasic().disable(); // Disable HTTP basic authentication
        http.csrf(csrf -> csrf.disable());
        http.formLogin(formLogin -> formLogin.disable()); // No configuration is needed if you want to disable it by default.
        http.httpBasic(httpBasic -> httpBasic.disable()); // Disables HTTP Basic Authentication by default.
        
        return http.build();
    }

    
    @Bean
    public CorsFilter corsFilter() {
        CorsConfiguration config = new CorsConfiguration();
        config.addAllowedOrigin("*");
        config.addAllowedHeader("*");
        config.addAllowedMethod("*");

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", config);

        return new CorsFilter(source);
    }
/*
    @Bean
    public UserDetailsService userDetailsService() {
        // Example in-memory authentication
    	var user = User.withUsername("admin")
            .password("{noop}pass") // {noop} indicates plain text password, use a password encoder in production
            .roles("USER")
            .build();

        return new InMemoryUserDetailsManager(user);
    }
*/

}