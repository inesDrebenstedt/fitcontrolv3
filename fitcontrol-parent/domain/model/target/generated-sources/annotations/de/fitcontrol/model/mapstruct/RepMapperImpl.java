package de.fitcontrol.model.mapstruct;

import de.fitcontrol.model.Rep;
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
public class RepMapperImpl implements RepMapper {

    @Override
    public Rep updateRepFromDto(Rep incomingRep, Rep repFromDB) {
        if ( incomingRep == null ) {
            return repFromDB;
        }

        repFromDB.setCategory( incomingRep.getCategory() );
        repFromDB.setExerciseSet( incomingRep.getExerciseSet() );

        return repFromDB;
    }

    @Override
    public Rep mapElement(Rep source) {
        if ( source == null ) {
            return null;
        }

        Rep.RepBuilder<?, ?> rep = Rep.builder();

        rep.category( source.getCategory() );
        rep.exerciseSet( source.getExerciseSet() );
        rep.id( source.getId() );

        return rep.build();
    }

    @Override
    public List<Rep> mapElementList(List<Rep> sourceList) {
        if ( sourceList == null ) {
            return null;
        }

        List<Rep> list = new ArrayList<Rep>( sourceList.size() );
        for ( Rep rep : sourceList ) {
            list.add( mapElement( rep ) );
        }

        return list;
    }
}
