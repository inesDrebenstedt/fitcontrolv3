package de.fitcontrol.fitcontrol.config;


import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	/*
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/fitcontrol/tracker/workout/all")
            .allowedOrigins("http://localhost:8080", "http://localhost:4200") // Erlauben Sie den Zugriff nur von dieser Adresse
            .allowedMethods("GET", "POST", "PUT", "DELETE"); // Erlauben Sie bestimmte HTTP-Methoden
    }
    */
}
