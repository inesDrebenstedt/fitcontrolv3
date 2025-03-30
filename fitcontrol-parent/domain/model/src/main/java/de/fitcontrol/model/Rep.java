package de.fitcontrol.model;

import com.fasterxml.jackson.annotation.JsonBackReference;

import de.fitcontrol.model.enums.RepCategory;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Entity	
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
public class Rep {
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
    @Getter
    private Long id;
	
	@Getter
	@Setter
	@Enumerated(EnumType.STRING)
	private RepCategory category;
	
	@Setter
	@Getter
	@ManyToOne
	@JsonBackReference(value = "workout-set-reps")
	@JoinColumn(name="exercise_set_id", updatable = true)
	private ExerciseSet exerciseSet;
	
}
