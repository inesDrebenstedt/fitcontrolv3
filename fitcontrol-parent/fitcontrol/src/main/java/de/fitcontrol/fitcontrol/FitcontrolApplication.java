package de.fitcontrol.fitcontrol;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackages = "de.fitcontrol.service.ports")
@EntityScan(basePackages = "de.fitcontrol.model") 
@ComponentScan( basePackages={"de.fitcontrol", "de.fitcontrol.service.ports", "de.fitcontrol.restapi.controller"})
public class FitcontrolApplication {

	public static void main(String[] args) {
		SpringApplication.run(FitcontrolApplication.class, args);
	}

}
