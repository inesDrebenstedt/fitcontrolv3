package de.fitcontrol.model.mapstruct;

import java.util.List;

import org.mapstruct.BeanMapping;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;
import org.mapstruct.factory.Mappers;

import de.fitcontrol.model.ExerciseSet;

@Mapper
public interface ExerciseSetMapper {
	
	ExerciseSetMapper INSTANCE = Mappers.getMapper(ExerciseSetMapper.class);

    @BeanMapping(ignoreByDefault = true)
    @Mapping(source = "incomingExerciseSet.weight", target = "weight")
    @Mapping(source = "incomingExerciseSet.unit", target = "unit")
    @Mapping(source = "incomingExerciseSet.reps", target = "reps")
    @Mapping(source = "incomingExerciseSet.description", target = "description")
    @Mapping(source = "incomingExerciseSet.workoutexercise", target = "workoutexercise")
	ExerciseSet updateExerciseSetFromDto(ExerciseSet incomingExerciseSet,
			@MappingTarget ExerciseSet exerciseSetFromDB);
    
    // Map individual elements
    ExerciseSet mapElement(ExerciseSet source);

    // Map a list of elements
    List<ExerciseSet> mapElementList(List<ExerciseSet> sourceList);

}
