package de.fitcontrol.service.test;


import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.jdbc.Sql;

import de.fitcontrol.model.Workout;
import de.fitcontrol.service.WorkoutService;
import de.fitcontrol.service.ports.WorkoutRepository;

@DirtiesContext
@SpringBootTest(classes = {TestApplication.class, TestConfig.class})
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.ANY)
@Sql(scripts = "/testdata.sql")
@TestPropertySource(locations = "classpath:application-test.properties")
@ActiveProfiles("test")
public class WorkoutServiceTest {

	@Autowired
    private WorkoutService workoutService;
	
	@Autowired
    private WorkoutRepository workoutrepo;


    @Test
    void testFindAllWorkouts() {
    	int numberOfAllWorkouts = workoutrepo.findAll().size();
    	assertEquals(numberOfAllWorkouts, workoutService.showAllWorkouts().size());
    }
    
    @Test
    void testCreateWorkout() {
    	String newIdInt = String.valueOf(workoutService.showAllWorkouts().size()+1);
    	
    	Workout newWorkout = Workout.builder()
    			.title("new Test Workout")
    			.date(LocalDateTime.now())
    			.duration(Duration.ofSeconds(3600))
    			.workoutexercises(null)
    			.build();
    	
    	assertFalse(workoutService.showAllWorkouts().stream().anyMatch(workout -> workout.getTitle().equals(newWorkout.getTitle())));
    	workoutService.createWorkout(newWorkout);	
    	assertTrue(workoutService.showAllWorkouts().stream().anyMatch(workout -> workout.getTitle().equals(newWorkout.getTitle())));
    }
    
    @Test
    void testDeleteWorkout() {
    	String newIdInt = String.valueOf(workoutService.showAllWorkouts().size()+1);
    	
    	Workout newWorkout = Workout.builder()
    			.title("another Test Workout")
    			.date(LocalDateTime.now())
    			.duration(Duration.ofSeconds(3600))
    			.workoutexercises(null)
    			.build();
    	
    	assertFalse(workoutService.showAllWorkouts().stream().anyMatch(workout -> workout.getTitle().equals(newWorkout.getTitle())));
    	workoutService.createWorkout(newWorkout);
    	assertTrue(workoutService.showAllWorkouts().stream().anyMatch(workout -> workout.getTitle().equals(newWorkout.getTitle())));
    	List<Workout> list = workoutService.showAllWorkouts().stream().filter(workout -> workout.getTitle().equals(newWorkout.getTitle())).toList();
    	list.forEach(w ->{
    		if(w.getTitle().equals(newWorkout.getTitle())) {
    			workoutService.deleteWorkoutById(w.getId());
    		}
    	});
    	
    	assertFalse(workoutService.showAllWorkouts().stream().anyMatch(workout -> workout.getTitle().equals(newWorkout.getTitle())));
    }
    
}
