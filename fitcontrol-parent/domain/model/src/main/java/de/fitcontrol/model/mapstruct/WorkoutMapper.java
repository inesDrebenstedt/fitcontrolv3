package de.fitcontrol.model.mapstruct;

import java.util.List;

import org.mapstruct.BeanMapping;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;
import org.mapstruct.factory.Mappers;

import de.fitcontrol.model.Workout;

@Mapper
public interface WorkoutMapper {
    WorkoutMapper INSTANCE = Mappers.getMapper(WorkoutMapper.class);
    
    @BeanMapping(ignoreByDefault = true)
    @Mapping(source = "incomingWorkout.title", target = "title")
    @Mapping(source = "incomingWorkout.workoutexercises", target = "workoutexercises")
    @Mapping(source = "incomingWorkout.date", target = "date")
    @Mapping(source = "incomingWorkout.duration", target = "duration")
    Workout updateWorkoutFromDto(Workout incomingWorkout, @MappingTarget Workout workoutFromDB);
    
    
    // Map individual elements
    Workout mapElement(Workout source);

    // Map a list of elements
    List<Workout> mapElementList(List<Workout> sourceList);
}
