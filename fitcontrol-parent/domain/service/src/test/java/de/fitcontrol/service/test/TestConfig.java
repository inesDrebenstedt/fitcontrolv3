package de.fitcontrol.service.test;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@TestConfiguration
@EnableJpaRepositories(basePackages = "de.fitcontrol.service.ports")
@EntityScan(basePackages = "de.fitcontrol.model")
public class TestConfig {

}
