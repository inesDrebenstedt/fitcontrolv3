package de.fitcontrol.service.ports;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import de.fitcontrol.model.Exercise;

@Repository
public interface ExerciseRepository extends JpaRepository<Exercise, Long>{

}
