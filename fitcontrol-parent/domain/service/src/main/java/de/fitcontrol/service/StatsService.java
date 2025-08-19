package de.fitcontrol.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import de.fitcontrol.service.ports.ExerciseRepository;
import de.fitcontrol.service.ports.ExerciseSetRepository;
import de.fitcontrol.service.ports.RepRepository;
import de.fitcontrol.service.ports.WorkoutExerciseRepository;
import de.fitcontrol.service.ports.WorkoutRepository;

@Service
public class StatsService {
	
	@Autowired
	WorkoutRepository workoutRepo;
	@Autowired
	WorkoutExerciseRepository workoutExerciseRepo;
	@Autowired
	ExerciseRepository exerciseRepo;
	@Autowired
	ExerciseSetRepository exerciseSetRepo;
	@Autowired
	RepRepository repRepo;

}
