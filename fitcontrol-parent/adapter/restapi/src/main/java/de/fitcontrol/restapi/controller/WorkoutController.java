package de.fitcontrol.restapi.controller;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import de.fitcontrol.model.ExerciseSet;
import de.fitcontrol.model.Workout;
import de.fitcontrol.model.enums.MuscleGroup;
import de.fitcontrol.restapi.controller.json.WorkoutDto;
import de.fitcontrol.service.WorkoutService;
import de.fitcontrol.service.ports.WorkoutRepository;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
//import lombok.extern.slf4j.Slf4j;

@RestController
//@Slf4j
@RequestMapping(value = "/workout", produces = { "application/json" })
public class WorkoutController {
	
	@Autowired WorkoutService workoutService;
	@Autowired WorkoutRepository workoutRepo;
	
	@ApiResponse(responseCode = "200", description = "OK")
	@PostMapping("/create")
	public Workout createWorkout(@RequestBody Workout workout) {
		return workoutService.createWorkout(workout);
	}
	
	@PatchMapping("/{workoutId}")
	public ResponseEntity<Workout> updateWorkout(
	        @PathVariable Long workoutId,
	        @RequestBody Workout patchWorkout) {

	    Optional<Workout> updated = workoutService.patchWorkout(workoutId, patchWorkout);

	    return updated
	            .map(ResponseEntity::ok)
	            .orElse(ResponseEntity.notFound().build());
	}

	@PutMapping("/update")
	public Workout updateWorkout(@RequestBody Workout workout) {
		return workoutService.updateWorkout(workout);
	}
	
	@PutMapping("/addWorkoutExercise")
	public Workout addWorkoutExercise(@RequestParam Long workoutId, @RequestParam Long exerciseId) {
		 return workoutService.addWorkoutExercise(workoutId, exerciseId);
	}
	
	@PutMapping("/addWorkoutExerciseSet")
	public Workout addWorkoutExerciseSet(@RequestParam Long workoutExerciseId) {		
		 return workoutService.addWorkoutExerciseSet(workoutExerciseId);
	}
	
	@PostMapping("/saveExerciseSet")
	public void saveExerciseSet(@RequestParam Long workoutExerciseId, @RequestBody ExerciseSet set) {	
		  System.out.println("----------- WO controller, /saveExerciseSet");
		workoutService.saveWorkoutExerciseSet(workoutExerciseId, set);
	}
	
	@DeleteMapping("/deleteExerciseSet")
	public void deleteExerciseSet(@RequestParam Long setId, @RequestParam Long workoutExerciseId) {	
		  workoutService.deleteExerciseSet(setId, workoutExerciseId);
	}
	
	@DeleteMapping("/deleteWorkoutExercise")
	public Workout deleteWorkoutExercise(@RequestBody Workout workout, @RequestParam Long workoutExerciseId) {	
		 return workoutService.deleteWorkoutExercise(workout, workoutExerciseId);
	}

	@ApiResponse(responseCode = "400", description = "Workout id wurde nicht gefunden")
	@DeleteMapping("/delete")
	public void delete(@RequestParam Long workoutId) {
		workoutService.deleteWorkoutById(workoutId);
	}
	
	@ApiResponse(responseCode = "200", description = "OK")
	@GetMapping("/all")
	public List<Workout> showAllWorkouts() {
		return (workoutService.showAllWorkouts());
	}
	
	@ApiResponse(responseCode = "200", description = "OK")
	@GetMapping("/createdworkout")
	public Workout findWorkoutByTitleAndCreationDate(@RequestParam String title, @RequestParam LocalDateTime creationTime) {
		System.out.println("-------------> /createdworkout");
		return workoutService.findWorkoutByTitleAndCreationDate(title, creationTime);
	}

	@ApiResponse(responseCode = "200", description = "OK")
	@GetMapping("/singleworkout")
	public Optional<Workout> showWorkout(@RequestParam Long workoutId) {
		return workoutRepo.findById(workoutId);
	}
	
	@ApiResponse(responseCode = "200", description = "OK")
	@GetMapping("/save")
	public Workout saveWorkout(@RequestBody Workout workout) {
		return workoutRepo.save(workout);
	}
	
	@ApiResponse(responseCode = "200", description = "OK")
	@GetMapping("/musclegroupstats")
	public Optional<Workout> getMusclegroupStats(MuscleGroup muscleGroup) {
		return null;
	}
	
	@ApiResponse(responseCode = "200", description = "OK")
	@GetMapping("/exercisestats")
	public Optional<Workout> getExerciseStats(MuscleGroup muscleGroup) {
		return null;
	}
	
	@ApiResponse(responseCode = "200", description = "OK")
	@GetMapping("/workoutstats")
	public Optional<Workout> getWorkoutStats(MuscleGroup muscleGroup) {
		return null;
	}

}
