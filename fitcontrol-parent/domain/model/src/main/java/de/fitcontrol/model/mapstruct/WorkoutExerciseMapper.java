package de.fitcontrol.model.mapstruct;

import java.util.List;

import org.mapstruct.BeanMapping;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;
import org.mapstruct.factory.Mappers;

import de.fitcontrol.model.WorkoutExercise;

@Mapper
public interface WorkoutExerciseMapper {
	
	WorkoutExerciseMapper INSTANCE = Mappers.getMapper(WorkoutExerciseMapper.class);

    @BeanMapping(ignoreByDefault = true)
    @Mapping(source = "incomingWorkoutExercise.description", target = "description")
    @Mapping(source = "incomingWorkoutExercise.sets", target = "sets")
    @Mapping(source = "incomingWorkoutExercise.workout", target = "workout")
    @Mapping(source = "incomingWorkoutExercise.referencedExercise", target = "referencedExercise")
	WorkoutExercise updateWorkoutExerciseFromDto(WorkoutExercise incomingWorkoutExercise,
			@MappingTarget WorkoutExercise workoutExerciseFromDB);
    
    // Map individual elements
    WorkoutExercise mapElement(WorkoutExercise source);

    // Map a list of elements
    List<WorkoutExercise> mapElementList(List<WorkoutExercise> sourceList);
}
