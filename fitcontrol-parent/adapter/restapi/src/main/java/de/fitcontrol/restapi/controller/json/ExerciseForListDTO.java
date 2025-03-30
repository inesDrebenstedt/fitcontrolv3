package de.fitcontrol.restapi.controller.json;

import java.util.ArrayList;
import java.util.List;

import de.fitcontrol.model.Exercise;
import lombok.Getter;
import lombok.experimental.SuperBuilder;

@Getter
@SuperBuilder
public class ExerciseForListDTO {

	private Long id;
	private String title;
	private String description;
//	private List<String> primaryMuscleGroups;
//	private List<String> secondaryMuscleGroups;
	
	public static ExerciseForListDTO from(Exercise exercise) {
//		 List<String> primaryMuscleGroups = new ArrayList<>();
//		 List<String> secondaryMuscleGroups = new ArrayList<>();
//		 
//		 exercise
//		 .getPrimaryMuscleGroups()
//		 .forEach(primaryMuscleGroup -> 
//		 primaryMuscleGroups.add(primaryMuscleGroup.name()));
//		 
//		 exercise
//		 .getSecondaryMuscleGroups()
//		 .forEach(secondaryMuscleGroup -> 
//		 secondaryMuscleGroups.add(secondaryMuscleGroup.name()));
//		 
		return ExerciseForListDTO.builder()
				.id(exercise.getId())
				.title(exercise.getTitle())
				.description(exercise.getDescription())
				//.primaryMuscleGroups(primaryMuscleGroups)
				//.secondaryMuscleGroups(secondaryMuscleGroups)
				.build();
	}
	
	
	public static List<ExerciseForListDTO> from(List<Exercise> exercises) {
		List<ExerciseForListDTO> exercisesDTO = new ArrayList<>();
		exercises.forEach(exercise -> exercisesDTO.add(from(exercise)));
		return exercisesDTO;
	}
	
	
}
