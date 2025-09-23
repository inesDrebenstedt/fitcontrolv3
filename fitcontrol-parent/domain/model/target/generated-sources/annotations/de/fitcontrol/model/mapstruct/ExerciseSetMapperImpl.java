package de.fitcontrol.model.mapstruct;

import de.fitcontrol.model.ExerciseSet;
import de.fitcontrol.model.Rep;
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
public class ExerciseSetMapperImpl implements ExerciseSetMapper {

    @Override
    public ExerciseSet updateExerciseSetFromDto(ExerciseSet incomingExerciseSet, ExerciseSet exerciseSetFromDB) {
        if ( incomingExerciseSet == null ) {
            return exerciseSetFromDB;
        }

        exerciseSetFromDB.setWeight( incomingExerciseSet.getWeight() );
        exerciseSetFromDB.setUnit( incomingExerciseSet.getUnit() );
        if ( exerciseSetFromDB.getReps() != null ) {
            Set<Rep> set = incomingExerciseSet.getReps();
            if ( set != null ) {
                exerciseSetFromDB.getReps().clear();
                exerciseSetFromDB.getReps().addAll( set );
            }
            else {
                exerciseSetFromDB.setReps( null );
            }
        }
        else {
            Set<Rep> set = incomingExerciseSet.getReps();
            if ( set != null ) {
                exerciseSetFromDB.setReps( new LinkedHashSet<Rep>( set ) );
            }
        }
        exerciseSetFromDB.setDescription( incomingExerciseSet.getDescription() );
        exerciseSetFromDB.setWorkoutexercise( incomingExerciseSet.getWorkoutexercise() );

        return exerciseSetFromDB;
    }

    @Override
    public ExerciseSet mapElement(ExerciseSet source) {
        if ( source == null ) {
            return null;
        }

        ExerciseSet.ExerciseSetBuilder<?, ?> exerciseSet = ExerciseSet.builder();

        exerciseSet.description( source.getDescription() );
        exerciseSet.id( source.getId() );
        exerciseSet.numberOfReps( source.getNumberOfReps() );
        Set<Rep> set = source.getReps();
        if ( set != null ) {
            exerciseSet.reps( new LinkedHashSet<Rep>( set ) );
        }
        exerciseSet.unit( source.getUnit() );
        exerciseSet.weight( source.getWeight() );
        exerciseSet.workoutexercise( source.getWorkoutexercise() );

        return exerciseSet.build();
    }

    @Override
    public List<ExerciseSet> mapElementList(List<ExerciseSet> sourceList) {
        if ( sourceList == null ) {
            return null;
        }

        List<ExerciseSet> list = new ArrayList<ExerciseSet>( sourceList.size() );
        for ( ExerciseSet exerciseSet : sourceList ) {
            list.add( mapElement( exerciseSet ) );
        }

        return list;
    }
}
