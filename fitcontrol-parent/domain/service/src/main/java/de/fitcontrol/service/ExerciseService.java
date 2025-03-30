package de.fitcontrol.service;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import de.fitcontrol.model.Exercise;
import de.fitcontrol.model.enums.MuscleGroup;
import de.fitcontrol.service.ports.ExerciseRepository;
import lombok.experimental.SuperBuilder;

@SuperBuilder
@Service
public class ExerciseService {

	@Autowired ExerciseRepository exerciseRepo;
	
	public Exercise createExercise(Exercise exercise) {
		Set<MuscleGroup> primaryMuscleGroups = new HashSet<>();
		exercise.getPrimaryMuscleGroups().forEach(mg -> {
			primaryMuscleGroups.add(mg);
		}
		
		);
		Set<MuscleGroup> secondaryMuscleGroups = new HashSet<>();
		exercise.getSecondaryMuscleGroups().forEach(mg -> secondaryMuscleGroups.add(mg));

		
		Exercise newExercise = Exercise.builder()
				.title(exercise.getTitle())
				.description(exercise.getDescription())
				.primaryMuscleGroups(primaryMuscleGroups)
				.secondaryMuscleGroups(secondaryMuscleGroups)
				.build();
		
		return exerciseRepo.save(newExercise);
		//return exerciseRepo.save(ExerciseMapper.INSTANCE.mapElement(newExercise));
	}

	public void updateExercise(Exercise exercise) {
		//TODO pmgs passen nicht in column
		exerciseRepo.save(exercise);
	}

	public void deleteExercise(Long exerciseId) {
		exerciseRepo.deleteById(exerciseId);		
	}
	
	public void showAllExercisesFromDB() {
		exerciseRepo.findAll();
	}

	public Optional<Exercise> showExercise(Long exerciseId) {
		return exerciseRepo.findById(exerciseId);
	}


}
