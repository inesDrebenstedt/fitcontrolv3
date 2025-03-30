package de.fitcontrol.service.ports;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import de.fitcontrol.model.Rep;

@Repository
public interface RepRepository extends JpaRepository<Rep, Long>{

}
