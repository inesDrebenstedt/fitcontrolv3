package de.fitcontrol.restapi.controller.json;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WorkoutExerciseDto {
    private Long id;
    private String description;
    private Long referencedExerciseId;
    private List<ExerciseSetDto> sets;
}
