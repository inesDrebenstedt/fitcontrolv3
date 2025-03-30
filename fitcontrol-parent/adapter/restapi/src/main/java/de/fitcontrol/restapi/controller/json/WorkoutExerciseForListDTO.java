package de.fitcontrol.restapi.controller.json;


import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import de.fitcontrol.model.WorkoutExercise;
import lombok.Getter;
import lombok.experimental.SuperBuilder;

@Getter
@SuperBuilder
public class WorkoutExerciseForListDTO {
	
	private Long id;
	private String title;
	private String description;
	
	public static WorkoutExerciseForListDTO from(WorkoutExercise workoutexercise) {
		return WorkoutExerciseForListDTO.builder()
				.id(workoutexercise.getId())
				.title(workoutexercise.getTitle())
				.description(workoutexercise.getDescription())
				.build();
	}
	
//	public static List<WorkoutExerciseForListDTO> from(Set<WorkoutExercise> workoutexercises) {
//		List<WorkoutExerciseForListDTO> workoutexercisesDTO = new ArrayList<>();
//		workoutexercises.forEach(workoutexercise -> workoutexercisesDTO.add(from(workoutexercise)));
//		return workoutexercisesDTO;
//	}

}
