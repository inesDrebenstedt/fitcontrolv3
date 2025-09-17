package de.fitcontrol.model.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
public enum Country {
	
	Germany("Germany"), 
	USA("USA"), 
	China("China"), 
	Japan("Japan"), 
	France("France"), 
	Ireland("Ireland"), 
	Great_Britain("Great_Britain"), 
	Sweden("Sweden");
	
	 private final String value;
	
	
	Country(String value) {
		this.value = value;
	}
	
	
	

}
