package de.fitcontrol.model;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonGetter;
import com.fasterxml.jackson.annotation.JsonManagedReference;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.SuperBuilder;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
public class WorkoutExercise {
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
    @Getter
    private Long id;
	
	@Getter
	private String title;
	
	@Getter
	@Setter
	private String description;
	
	@Setter
	@OneToMany(mappedBy = "workoutexercise", 	cascade = {
			CascadeType.ALL} , orphanRemoval = true)
	@JsonManagedReference(value = "workout-exerciseset")
	private List<ExerciseSet> sets;
	
	@Setter
	@Getter
	@ManyToOne
	@JsonBackReference(value = "workout-exercise")
	@JoinColumn(name = "workout_id", updatable = true)
	private Workout workout;
	
	@Getter
	@Setter
    @ManyToOne
	@JsonBackReference(value = "referenced-exercise")
    @JoinColumn(name= "exercise_id")
	private Exercise referencedExercise;
	
	
    @JsonGetter("workout_id")
    public Long getWorkoutId() {
        return this.workout != null ? this.workout.getId() : null;
    }

    @JsonGetter("exercise_id")
    public Long getExerciseId() {
        return this.referencedExercise != null ? this.referencedExercise.getId() : null;
    }
	
	
	public List<ExerciseSet> getSets() {
		if (this.sets == null) {
			this.sets = new ArrayList<ExerciseSet>();
		}
		return sets;
	}


	public void setTitle() {
		if (this.title == null || this.title.isEmpty()) { //TODO check isEmpty is necessary
			this.title = this.referencedExercise.getTitle();
		}
		
	}
	
	public void addExerciseSet(ExerciseSet set) {
	    if (set.getId() == null) {
	        set.setWorkoutexercise(this);
	        this.sets.add(set);
	    } else {
	        updateExerciseSet(set);
	    }
	}
	
	public void updateExerciseSet(ExerciseSet updatedSet) {
	    ExerciseSet existing = this.sets.stream()
	            .filter(s -> s.getId().equals(updatedSet.getId()))
	            .findFirst()
	            .orElseThrow(() -> new IllegalArgumentException("Set not found"));

	    existing.setDescription(updatedSet.getDescription());
	    existing.setWeight(updatedSet.getWeight());
	    existing.setUnit(updatedSet.getUnit());

	    // update reps safely
	    for (Rep rep : updatedSet.getReps()) {
	        if (rep.getId() == null) {
	            existing.addRep(rep);
	        } else {
	            existing.updateRep(rep);
	        }
	    }

	    existing.setNumberOfReps();
	}

	public void removeExerciseSet(Long setId) {
	    this.sets.removeIf(s -> s.getId().equals(setId));
	}

	/*
	@Override
	public String toString() {
		return "WorkoutExercise [id=" + id + ", title=" + title + ", description=" + description + ", sets=" + sets
				+ ", workoutId=" + workout + ", referencedExerciseTitle=" + referencedExercise.getTitle() + "]";
	}
	*/
	

	
}
