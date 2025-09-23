package de.fitcontrol.model.mapstruct;

import de.fitcontrol.model.ExerciseSet;
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
public class WorkoutExerciseMapperImpl implements WorkoutExerciseMapper {

    @Override
    public WorkoutExercise updateWorkoutExerciseFromDto(WorkoutExercise incomingWorkoutExercise, WorkoutExercise workoutExerciseFromDB) {
        if ( incomingWorkoutExercise == null ) {
            return workoutExerciseFromDB;
        }

        workoutExerciseFromDB.setDescription( incomingWorkoutExercise.getDescription() );
        if ( workoutExerciseFromDB.getSets() != null ) {
            List<ExerciseSet> list = incomingWorkoutExercise.getSets();
            if ( list != null ) {
                workoutExerciseFromDB.getSets().clear();
                workoutExerciseFromDB.getSets().addAll( list );
            }
            else {
                workoutExerciseFromDB.setSets( null );
            }
        }
        else {
            List<ExerciseSet> list = incomingWorkoutExercise.getSets();
            if ( list != null ) {
                workoutExerciseFromDB.setSets( new ArrayList<ExerciseSet>( list ) );
            }
        }
        workoutExerciseFromDB.setWorkout( incomingWorkoutExercise.getWorkout() );
        workoutExerciseFromDB.setReferencedExercise( incomingWorkoutExercise.getReferencedExercise() );

        return workoutExerciseFromDB;
    }

    @Override
    public WorkoutExercise mapElement(WorkoutExercise source) {
        if ( source == null ) {
            return null;
        }

        WorkoutExercise.WorkoutExerciseBuilder<?, ?> workoutExercise = WorkoutExercise.builder();

        workoutExercise.description( source.getDescription() );
        workoutExercise.id( source.getId() );
        workoutExercise.referencedExercise( source.getReferencedExercise() );
        List<ExerciseSet> list = source.getSets();
        if ( list != null ) {
            workoutExercise.sets( new ArrayList<ExerciseSet>( list ) );
        }
        workoutExercise.title( source.getTitle() );
        workoutExercise.workout( source.getWorkout() );

        return workoutExercise.build();
    }

    @Override
    public List<WorkoutExercise> mapElementList(List<WorkoutExercise> sourceList) {
        if ( sourceList == null ) {
            return null;
        }

        List<WorkoutExercise> list = new ArrayList<WorkoutExercise>( sourceList.size() );
        for ( WorkoutExercise workoutExercise : sourceList ) {
            list.add( mapElement( workoutExercise ) );
        }

        return list;
    }
}
