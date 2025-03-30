package de.fitcontrol.service.ports;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import de.fitcontrol.model.ExerciseSet;

@Repository
public interface ExerciseSetRepository extends JpaRepository<ExerciseSet, Long>{

}
