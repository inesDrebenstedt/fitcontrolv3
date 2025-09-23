package de.fitcontrol.model.mapstruct;

import de.fitcontrol.model.Exercise;
import de.fitcontrol.model.enums.MuscleGroup;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2025-09-23T10:24:03+0200",
    comments = "version: 1.5.2.Final, compiler: Eclipse JDT (IDE) 3.41.0.v20250213-1140, environment: Java 21.0.6 (Eclipse Adoptium)"
)
@Component
public class ExerciseMapperImpl implements ExerciseMapper {

    @Override
    public Exercise updateExerciseFromDto(Exercise incomingExercise, Exercise exerciseFromDB) {
        if ( incomingExercise == null ) {
            return exerciseFromDB;
        }

        exerciseFromDB.setTitle( incomingExercise.getTitle() );
        exerciseFromDB.setDescription( incomingExercise.getDescription() );
        if ( exerciseFromDB.getPrimaryMuscleGroups() != null ) {
            Set<MuscleGroup> set = incomingExercise.getPrimaryMuscleGroups();
            if ( set != null ) {
                exerciseFromDB.getPrimaryMuscleGroups().clear();
                exerciseFromDB.getPrimaryMuscleGroups().addAll( set );
            }
            else {
                exerciseFromDB.setPrimaryMuscleGroups( null );
            }
        }
        else {
            Set<MuscleGroup> set = incomingExercise.getPrimaryMuscleGroups();
            if ( set != null ) {
                exerciseFromDB.setPrimaryMuscleGroups( new LinkedHashSet<MuscleGroup>( set ) );
            }
        }
        if ( exerciseFromDB.getSecondaryMuscleGroups() != null ) {
            Set<MuscleGroup> set1 = incomingExercise.getSecondaryMuscleGroups();
            if ( set1 != null ) {
                exerciseFromDB.getSecondaryMuscleGroups().clear();
                exerciseFromDB.getSecondaryMuscleGroups().addAll( set1 );
            }
            else {
                exerciseFromDB.setSecondaryMuscleGroups( null );
            }
        }
        else {
            Set<MuscleGroup> set1 = incomingExercise.getSecondaryMuscleGroups();
            if ( set1 != null ) {
                exerciseFromDB.setSecondaryMuscleGroups( new LinkedHashSet<MuscleGroup>( set1 ) );
            }
        }

        return exerciseFromDB;
    }

    @Override
    public Exercise mapElement(Exercise source) {
        if ( source == null ) {
            return null;
        }

        Exercise.ExerciseBuilder<?, ?> exercise = Exercise.builder();

        exercise.description( source.getDescription() );
        exercise.id( source.getId() );
        Set<MuscleGroup> set = source.getPrimaryMuscleGroups();
        if ( set != null ) {
            exercise.primaryMuscleGroups( new LinkedHashSet<MuscleGroup>( set ) );
        }
        Set<MuscleGroup> set1 = source.getSecondaryMuscleGroups();
        if ( set1 != null ) {
            exercise.secondaryMuscleGroups( new LinkedHashSet<MuscleGroup>( set1 ) );
        }
        exercise.title( source.getTitle() );

        return exercise.build();
    }

    @Override
    public List<Exercise> mapElementList(List<Exercise> sourceList) {
        if ( sourceList == null ) {
            return null;
        }

        List<Exercise> list = new ArrayList<Exercise>( sourceList.size() );
        for ( Exercise exercise : sourceList ) {
            list.add( mapElement( exercise ) );
        }

        return list;
    }
}
