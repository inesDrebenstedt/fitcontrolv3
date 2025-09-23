package de.fitcontrol.model.mapstruct;

import de.fitcontrol.model.Workout;
import de.fitcontrol.model.WorkoutExercise;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2025-09-23T10:24:03+0200",
    comments = "version: 1.5.2.Final, compiler: Eclipse JDT (IDE) 3.41.0.v20250213-1140, environment: Java 21.0.6 (Eclipse Adoptium)"
)
@Component
public class WorkoutMapperImpl implements WorkoutMapper {

    @Override
    public Workout updateWorkoutFromDto(Workout incomingWorkout, Workout workoutFromDB) {
        if ( incomingWorkout == null ) {
            return workoutFromDB;
        }

        if ( incomingWorkout.getTitle() != null ) {
            workoutFromDB.setTitle( incomingWorkout.getTitle() );
        }
        if ( workoutFromDB.getWorkoutexercises() != null ) {
            List<WorkoutExercise> list = incomingWorkout.getWorkoutexercises();
            if ( list != null ) {
                workoutFromDB.getWorkoutexercises().clear();
                workoutFromDB.getWorkoutexercises().addAll( list );
            }
        }
        else {
            List<WorkoutExercise> list = incomingWorkout.getWorkoutexercises();
            if ( list != null ) {
                workoutFromDB.setWorkoutexercises( new ArrayList<WorkoutExercise>( list ) );
            }
        }
        if ( incomingWorkout.getDate() != null ) {
            workoutFromDB.setDate( incomingWorkout.getDate() );
        }
        if ( incomingWorkout.getDuration() != null ) {
            workoutFromDB.setDuration( incomingWorkout.getDuration() );
        }

        return workoutFromDB;
    }

    @Override
    public Workout mapElement(Workout source) {
        if ( source == null ) {
            return null;
        }

        Workout.WorkoutBuilder<?, ?> workout = Workout.builder();

        workout.date( source.getDate() );
        workout.duration( source.getDuration() );
        workout.id( source.getId() );
        workout.title( source.getTitle() );
        List<WorkoutExercise> list = source.getWorkoutexercises();
        if ( list != null ) {
            workout.workoutexercises( new ArrayList<WorkoutExercise>( list ) );
        }

        return workout.build();
    }

    @Override
    public List<Workout> mapElementList(List<Workout> sourceList) {
        if ( sourceList == null ) {
            return null;
        }

        List<Workout> list = new ArrayList<Workout>( sourceList.size() );
        for ( Workout workout : sourceList ) {
            list.add( mapElement( workout ) );
        }

        return list;
    }
}
