package de.fitcontrol.restapi.controller.json;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import de.fitcontrol.model.Workout;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Getter
@SuperBuilder
public class WorkoutForListDTO {
	
	private Long id;
	private String date;
	private String title;
	private String duration;
	
	public static WorkoutForListDTO from(Workout workout) {

		return WorkoutForListDTO.builder()
				.id(workout.getId())
				.title(workout.getTitle())
				.date(workout.getDate().toString())
				.duration(workout.getDuration().toString())
				.build();
	}
	
	public static List<WorkoutForListDTO> from(List<Workout> workouts) {
		List<WorkoutForListDTO> workoutsForListDTO = new ArrayList<>();
		workouts.forEach(workout -> {
			workoutsForListDTO.add(from(workout));
		});
		
		return workoutsForListDTO;
	}
	

}
