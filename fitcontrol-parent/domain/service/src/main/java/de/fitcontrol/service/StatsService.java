package de.fitcontrol.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import de.fitcontrol.model.Workout;
import de.fitcontrol.model.enums.MuscleGroup;
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
	
	
	public Map<MuscleGroup, Integer> getPrimaryMuscleGroupStats(){
		List<Workout> workouts = workoutRepo.findAll();
		List<MuscleGroup> muscleGroups = Arrays.asList(MuscleGroup.values());	
		Map<MuscleGroup, Integer> result = new HashMap<>();
		List<Integer> counts = new LinkedList<>();
		
		muscleGroups.forEach(mg -> {
			
			int[] count = {0};
			for(Workout wo : workouts) {
				
				wo.getWorkoutexercises().forEach(woe -> {
					woe.getReferencedExercise().getPrimaryMuscleGroups().forEach(mgr -> {
						count[0]++; 
					});
				});
			}
			
			result.put(mg, count[0]);
		});
		
		for (Map.Entry<MuscleGroup, Integer> entry : result.entrySet()) {
		    System.out.println("===================> Key: " + entry.getKey() + ", Value: " + entry.getValue());
		}
				
		
		return result;
	}

}
