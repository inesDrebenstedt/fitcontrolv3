package de.fitcontrol.restapi.controller.json;

import java.util.ArrayList;
import java.util.List;

import de.fitcontrol.model.Rep;
import lombok.Getter;
import lombok.experimental.SuperBuilder;

@Getter
@SuperBuilder
public class RepForListDTO {
	
	private Long id;
	private String category;
	
	public static RepForListDTO from(Rep rep) {
		return RepForListDTO.builder()
				.id(rep.getId())
				.category(rep.getCategory().name())
				.build();
	}
	
	
	public static List<RepForListDTO> from(List<Rep> reps) {
		List<RepForListDTO> repsDTO = new ArrayList<>();
		reps.forEach(rep -> {
			repsDTO.add(from(rep));
		});
		
		return repsDTO;
	}

}
