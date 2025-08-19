package de.fitcontrol.restapi.controller;

import java.sql.SQLException;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import de.fitcontrol.model.Exercise;
import de.fitcontrol.service.ExerciseService;
import de.fitcontrol.service.ports.ExerciseRepository;
import io.swagger.v3.oas.annotations.responses.ApiResponse;

@RestController
@RequestMapping(value = "/exercise", produces = { "application/json" })
public class ExerciseController {	

	@Autowired ExerciseService exerciseService;
	@Autowired ExerciseRepository exerciseRepository;
	
	@ApiResponse(responseCode = "200", description = "OK")
	@PostMapping("/create")
	public void createExercise(@RequestBody Exercise exercise) {
		exerciseService.createExercise(exercise);
	}

	@PutMapping("/update")
	public void updateExercise(@RequestBody Exercise exercise) {
		exerciseService.updateExercise(exercise);
	}

	@ApiResponse(responseCode = "400", description = "Seriennummer fehlt")
	@DeleteMapping("/delete")
	public void delete(@RequestParam Long exerciseId) throws SQLException {
		exerciseService.deleteExercise(exerciseId);
	}

	
	@ApiResponse(responseCode = "200", description = "OK")
	@GetMapping("/all")
	public List<Exercise>  showAllExercisesFromDB() {
		System.out.println("---------------- showAllExercisesFromDB");
		List<Exercise> exercises = exerciseRepository.findAll();
		Collections.sort(exercises, (e2, e1) -> e2.getTitle().compareTo(e1.getTitle()));
		return exercises;
	}
	
	@ApiResponse(responseCode = "200", description = "OK")
	@GetMapping("/singleexercise")
	public Optional<Exercise> showExercise(@RequestParam Long exerciseId) {
		Optional<Exercise> test = exerciseService.showExercise(exerciseId);
		System.out.println("------------------- ...:" + test.get().getTitle());
		return exerciseService.showExercise(exerciseId);
	}
	

}

