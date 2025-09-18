package de.fitcontrol.model;

import java.time.LocalDateTime;
import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
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
public class AppUser {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Getter
    private Long id;
    
    @Column(unique = true, nullable = false)
    private String keycloakUserId;
    
    private LocalDateTime lastLogin;
    
    @Getter
    @Setter
    private String userName;
    
    @Getter
    private String passwordHash; 
        
    @Getter
    @Setter
    private String firstName;
    
    @Getter
    @Setter
    private String LastName;
    
    @Getter
    @Setter
    private String email;
    
    @Getter
    @Setter
    private String phoneNumber;
    
    @Getter
    @Setter
    @ManyToMany(mappedBy = "addressOwners")
    private Set<Address> adresses;
    
    @Getter
    @Setter
    @OneToMany(mappedBy = "appUser", cascade = {
			CascadeType.DETACH, 
			CascadeType.PERSIST, 
			CascadeType.REFRESH, 
			CascadeType.REMOVE, 
			CascadeType.MERGE
			} ,orphanRemoval = true)
    private Set<Workout> workouts;

}
