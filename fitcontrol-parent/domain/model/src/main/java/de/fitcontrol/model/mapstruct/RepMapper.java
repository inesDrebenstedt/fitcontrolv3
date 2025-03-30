package de.fitcontrol.model.mapstruct;

import java.util.List;

import org.mapstruct.BeanMapping;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;
import org.mapstruct.factory.Mappers;

import de.fitcontrol.model.Rep;

@Mapper
public interface RepMapper {
	
	RepMapper INSTANCE = Mappers.getMapper(RepMapper.class);
	
    @BeanMapping(ignoreByDefault = true)
    @Mapping(source = "incomingRep.category", target = "category")
    @Mapping(source = "incomingRep.exerciseSet", target = "exerciseSet")
    Rep updateRepFromDto(Rep incomingRep, @MappingTarget Rep repFromDB);
    
    // Map individual elements
    Rep mapElement(Rep source);

    // Map a list of elements
    List<Rep> mapElementList(List<Rep> sourceList);


}
