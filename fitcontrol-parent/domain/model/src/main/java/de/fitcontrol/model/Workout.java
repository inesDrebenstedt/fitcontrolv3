package de.fitcontrol.model;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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
@JsonIdentityInfo(generator=ObjectIdGenerators.PropertyGenerator.class, property="id")
public class Workout {
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
    @Getter
    private Long id;

	@Setter
	@OneToMany(mappedBy = "workout", cascade = {
			CascadeType.DETACH, 
			CascadeType.PERSIST, 
			CascadeType.REFRESH, 
			CascadeType.REMOVE, 
			CascadeType.MERGE
			} ,orphanRemoval = true)
	@JsonManagedReference(value = "workout-exercise")
	private List<WorkoutExercise> workoutexercises;
	
	@Getter
	@Setter
	private String title;
	
	@Getter
	@Setter
	private LocalDateTime date;
	
	@Getter
	@Setter
	private Duration duration;
	
	
	public List<WorkoutExercise> getWorkoutexercises() {
		if (this.workoutexercises == null) {
			this.workoutexercises = new ArrayList<WorkoutExercise>();
		}
		return this.workoutexercises;
	}
	
	public void addWorkoutExercise(WorkoutExercise exercise) {
	    if (exercise.getId() == null) { // new child
	        exercise.setWorkout(this);
	        this.workoutexercises.add(exercise);
	    } else {
	        updateWorkoutExercise(exercise);
	    }
	}
	
	public void updateWorkoutExercise(WorkoutExercise updatedExercise) {
	    WorkoutExercise existing = this.workoutexercises.stream()
	            .filter(ex -> ex.getId().equals(updatedExercise.getId()))
	            .findFirst()
	            .orElseThrow(() -> new IllegalArgumentException("Exercise not found"));

	    existing.setDescription(updatedExercise.getDescription());
	    existing.setReferencedExercise(updatedExercise.getReferencedExercise());
	    existing.setTitle(); // recalculates title from referencedExercise if needed

	    // update sets safely
	    for (ExerciseSet set : updatedExercise.getSets()) {
	        if (set.getId() == null) {
	            existing.addExerciseSet(set); // add new set
	        } else {
	            existing.updateExerciseSet(set); // update existing set
	        }
	    }
	}

	
//	public void updateWorkoutExercise(WorkoutExercise updatedExercise) {
//		this.workoutexercises.removeIf(exercise -> exercise.getId().equals(updatedExercise.getId()));
//		this.workoutexercises.add(updatedExercise);
//	}
	
	public void deleteWorkoutExercise(WorkoutExercise updatedExercise) {
		this.workoutexercises.removeIf(exercise -> exercise.getId().equals(updatedExercise.getId()));
	}
	/*
	 * should be same as
	 * public void removeWorkoutExercise(Long exerciseId) {
    this.workoutexercises.removeIf(ex -> ex.getId().equals(exerciseId));
}
	 */
	
	public void addExerciseSet(WorkoutExercise workoutExercise, ExerciseSet exerciseSet) {
		workoutExercise.getSets().add(exerciseSet);
		updateWorkoutExercise(workoutExercise);
	}
	
	public void updateExerciseSet(WorkoutExercise workoutExercise, ExerciseSet exerciseSet) {
		workoutExercise.getSets().removeIf(set -> set.getId().equals(exerciseSet.getId()));
		workoutExercise.getSets().add(exerciseSet);		
	}
	
	public void deleteExerciseSet(WorkoutExercise workoutExercise, ExerciseSet exerciseSet) {
		workoutExercise.getSets().removeIf(set -> set.getId().equals(exerciseSet.getId()));
	}
	
	public void addReps(ExerciseSet exerciseSet, Set<Rep> reps) {
		exerciseSet.getReps().addAll(reps);
	}
	
	public void deleteReps(ExerciseSet exerciseSet, Set<Rep> reps) {
		exerciseSet.getReps().removeAll(reps);
	}
	
//	public List<WorkoutExercise> getExercises() {
//		if (this.workoutexercises == null) {
//			this.workoutexercises = new ArrayList<>();
//		}
//		return workoutexercises;
//	}
	
	
//	public WorkoutExercise getWorkoutexercises(Long workoutExerciseId) {
//			return this.workoutexercises.stream().filter(exercise -> exercise.getId().equals(workoutExerciseId))
//            .findFirst().get();
//	}

}
