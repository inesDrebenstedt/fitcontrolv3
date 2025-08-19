package de.fitcontrol.restapi.controller.mapper;

import org.mapstruct.Mapper;

import de.fitcontrol.model.ExerciseSet;
import de.fitcontrol.model.Rep;
import de.fitcontrol.model.Workout;
import de.fitcontrol.model.WorkoutExercise;
import de.fitcontrol.restapi.controller.json.ExerciseSetDto;
import de.fitcontrol.restapi.controller.json.RepDto;
import de.fitcontrol.restapi.controller.json.WorkoutDto;
import de.fitcontrol.restapi.controller.json.WorkoutExerciseDto;

@Mapper(componentModel = "spring")
public interface WorkoutMapper {

    WorkoutDto toDto(Workout workout);
    Workout toEntity(WorkoutDto dto);

    WorkoutExerciseDto toDto(WorkoutExercise workoutExercise);
    WorkoutExercise toEntity(WorkoutExerciseDto dto);

    ExerciseSetDto toDto(ExerciseSet exerciseSet);
    ExerciseSet toEntity(ExerciseSetDto dto);

    RepDto toDto(Rep rep);
    Rep toEntity(RepDto dto);
}
