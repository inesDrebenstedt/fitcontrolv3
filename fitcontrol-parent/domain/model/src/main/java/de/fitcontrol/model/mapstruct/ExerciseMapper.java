package de.fitcontrol.model.mapstruct;

import java.util.List;

import org.mapstruct.BeanMapping;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;
import org.mapstruct.factory.Mappers;

import de.fitcontrol.model.Exercise;

@Mapper
public interface ExerciseMapper {
	ExerciseMapper INSTANCE = Mappers.getMapper(ExerciseMapper.class);

    @BeanMapping(ignoreByDefault = true)
    @Mapping(source = "incomingExercise.title", target = "title")
    @Mapping(source = "incomingExercise.description", target = "description")
    @Mapping(source = "incomingExercise.primaryMuscleGroups", target = "primaryMuscleGroups")
    @Mapping(source = "incomingExercise.secondaryMuscleGroups", target = "secondaryMuscleGroups")
    Exercise updateExerciseFromDto(Exercise incomingExercise, @MappingTarget Exercise exerciseFromDB);
    
    // Map individual elements
    Exercise mapElement(Exercise source);

    // Map a list of elements
    List<Exercise> mapElementList(List<Exercise> sourceList);


}
