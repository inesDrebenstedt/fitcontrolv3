package de.fitcontrol.model;

import java.util.Set;

import de.fitcontrol.model.enums.MuscleGroup;
import jakarta.persistence.JoinColumn;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.SuperBuilder;
import jakarta.persistence.CollectionTable;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


@Entity
@SuperBuilder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Exercise {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Getter
    private Long id;
        
    @Getter
    @Setter
    private String title;
    
    @Getter
    @Setter
    private String description;
    
    @Getter
    @Setter
    @ElementCollection(targetClass = MuscleGroup.class, fetch = FetchType.LAZY)
    @CollectionTable(name = "exercise_primary_muscle_groups", joinColumns = @JoinColumn(name = "exercise_id"))
    @Enumerated(EnumType.STRING)
    private Set<MuscleGroup> primaryMuscleGroups;
    
    @Getter
    @Setter
    @ElementCollection(targetClass = MuscleGroup.class, fetch = FetchType.LAZY)
    @CollectionTable(name = "exercise_secondary_muscle_groups", joinColumns = @JoinColumn(name = "exercise_id"))
    @Enumerated(EnumType.STRING)
    private Set<MuscleGroup> secondaryMuscleGroups;
}

