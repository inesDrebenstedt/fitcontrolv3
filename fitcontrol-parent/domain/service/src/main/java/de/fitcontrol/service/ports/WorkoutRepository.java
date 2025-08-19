package de.fitcontrol.service.ports;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import de.fitcontrol.model.Workout;

@Repository
public interface WorkoutRepository extends JpaRepository<Workout, Long>{

	List<Workout> findByDate(LocalDateTime date);
	List<Workout> findByTitle(String title);
}
