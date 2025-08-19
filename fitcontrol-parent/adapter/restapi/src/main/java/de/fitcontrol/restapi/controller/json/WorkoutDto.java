package de.fitcontrol.restapi.controller.json;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WorkoutDto {
    private Long id;
    private String title;
    private LocalDateTime date;
    private Duration duration;
    private List<WorkoutExerciseDto> workoutexercises;
}