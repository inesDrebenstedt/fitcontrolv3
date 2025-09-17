package de.fitcontrol.model;

import java.util.Set;

import de.fitcontrol.model.enums.Country;
import de.fitcontrol.model.enums.MuscleGroup;
import jakarta.persistence.CollectionTable;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.SuperBuilder;

@Entity
@SuperBuilder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Address {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Getter
    private Long id;
        
    @Getter
    @Setter
    @Enumerated(EnumType.STRING) 
    private Country country;
    
    @Getter
    @Setter
    private String state;
    
    @Getter
    @Setter
    private String county;
    
    @Getter
    @Setter
    private String city;
    
    @Getter
    @Setter
    private String zipCode;
    
    @Getter
    @Setter
    private String street;
    
    @Getter
    @Setter
    private String houseNumber;
    
    @Getter
    @Setter
    @ManyToMany
    @JoinTable(name = "app_user_address", 
    joinColumns = { @JoinColumn(name = "fk_app_user") }, 
    inverseJoinColumns = { @JoinColumn(name = "fk_address") })
    private Set<AppUser> addressOwners;
    

}
