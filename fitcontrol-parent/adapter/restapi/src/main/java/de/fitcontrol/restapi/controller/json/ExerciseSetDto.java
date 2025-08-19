package de.fitcontrol.restapi.controller.json;

import java.util.Set;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ExerciseSetDto {
    private Long id;
    private Double weight;
    private String unit;  // "KG" or "LB"
    private String description;
    private Integer numberOfReps;
    private Set<RepDto> reps;
}
