package de.fitcontrol.model;

import java.util.HashSet;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import de.fitcontrol.model.enums.WeightUnit;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.SuperBuilder;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@ToString
@SuperBuilder
public class ExerciseSet {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Getter
    private Long id;
	
	
	@Getter
	@Setter
	private Double weight;
	
	@Getter
	@Setter
	@Enumerated(EnumType.STRING)
	private WeightUnit unit;
	
	@Setter
	@OneToMany(mappedBy = "exerciseSet", 	cascade = {
			CascadeType.ALL} , orphanRemoval = true)
	@JsonManagedReference(value = "workout-set-reps")
	private Set<Rep> reps;
	
	@Getter
	@Setter
	private String description;
	
	@Getter
	private Integer numberOfReps;
	
	@Setter
	@Getter
	@ManyToOne(fetch = FetchType.LAZY)
	@JsonBackReference(value = "workout-exerciseset")
	@JoinColumn(name = "workoutexercise_id", updatable = true)
	private WorkoutExercise workoutexercise;

	public Set<Rep> getReps () {
		if (this.reps == null) {
			this.reps = new HashSet<Rep>();
		}
	
		return reps;
	}
	
	public void setNumberOfReps() {
		if(!this.reps.isEmpty()) {
			this.numberOfReps = this.reps.size();
		}
	}
	
	public void addRep(Rep rep) {
	    if (rep.getId() == null) {
	        rep.setExerciseSet(this);
	        this.reps.add(rep);
	    } else {
	        updateRep(rep);
	    }
	}

	public void updateRep(Rep updatedRep) {
	    Rep existing = this.reps.stream()
	            .filter(r -> r.getId().equals(updatedRep.getId()))
	            .findFirst()
	            .orElseThrow(() -> new IllegalArgumentException("Rep not found"));

	    existing.setCategory(updatedRep.getCategory());
	}

}

