package de.fitcontrol.service.test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.transaction.annotation.Transactional;

import de.fitcontrol.model.Exercise;
import de.fitcontrol.model.Workout;
import de.fitcontrol.service.WorkoutService;
import de.fitcontrol.service.ports.ExerciseRepository;
import de.fitcontrol.service.ports.WorkoutRepository;

@DirtiesContext
@SpringBootTest(classes = { TestApplication.class, TestConfig.class })
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.ANY)
@Sql(scripts = "/testdata.sql")
@TestPropertySource(locations = "classpath:application-test.properties")
@ActiveProfiles("test")
public class WorkoutServiceTest {

	@Autowired
	private WorkoutService workoutService;

	@Autowired
	private WorkoutRepository workoutRepo;

	@Autowired
	private ExerciseRepository exerciseRepo;

	private Workout testWorkout;
	private Exercise testExercise1;
	private Exercise testExercise2;

	@BeforeEach
	 void setUp() {
		testWorkout = workoutService.showAllWorkouts().get(0);
		testExercise1 = exerciseRepo.findAll().get(0);
		testExercise2 = exerciseRepo.findAll().get(1);
	}

	@Test
	void testFindAllWorkouts() {
		int numberOfAllWorkouts = workoutRepo.findAll().size();
		assertEquals(numberOfAllWorkouts, workoutService.showAllWorkouts().size());
	}

	@Test
	void testCreateWorkout() {
		String newIdInt = String.valueOf(workoutService.showAllWorkouts().size() + 1);

		Workout newWorkout = Workout.builder().title("new Test Workout").date(LocalDateTime.now())
				.duration(Duration.ofSeconds(3600)).workoutexercises(null).build();

		assertFalse(workoutService.showAllWorkouts().stream()
				.anyMatch(workout -> workout.getTitle().equals(newWorkout.getTitle())));
		workoutService.createWorkout(newWorkout);
		assertTrue(workoutService.showAllWorkouts().stream()
				.anyMatch(workout -> workout.getTitle().equals(newWorkout.getTitle())));
	}

	@Test
	void testDeleteWorkout() {
		String newIdInt = String.valueOf(workoutService.showAllWorkouts().size() + 1);

		Workout newWorkout = Workout.builder().title("another Test Workout").date(LocalDateTime.now())
				.duration(Duration.ofSeconds(3600)).workoutexercises(null).build();

		assertFalse(workoutService.showAllWorkouts().stream()
				.anyMatch(workout -> workout.getTitle().equals(newWorkout.getTitle())));
		workoutService.createWorkout(newWorkout);
		assertTrue(workoutService.showAllWorkouts().stream()
				.anyMatch(workout -> workout.getTitle().equals(newWorkout.getTitle())));
		List<Workout> list = workoutService.showAllWorkouts().stream()
				.filter(workout -> workout.getTitle().equals(newWorkout.getTitle())).toList();
		list.forEach(w -> {
			if (w.getTitle().equals(newWorkout.getTitle())) {
				workoutService.deleteWorkoutById(w.getId());
			}
		});

		assertFalse(workoutService.showAllWorkouts().stream()
				.anyMatch(workout -> workout.getTitle().equals(newWorkout.getTitle())));
	}

	@Test
	@Transactional
	void testCreateWorkoutExercise() {
		int numberOfWorkoutExercises = testWorkout.getWorkoutexercises().size();
		workoutService.addWorkoutExercise(testWorkout.getId(), testExercise1.getId());
		assertEquals(numberOfWorkoutExercises + 1, testWorkout.getWorkoutexercises().size());
	}

	@Test
	@Transactional
	void testUpdateWorkout() {
		String workoutTitle = testWorkout.getTitle();
		Workout patchWorkout = testWorkout.builder().id(testWorkout.getId()).title("new test title").build();
		workoutService.patchWorkout(patchWorkout);
		assertEquals("new test title", testWorkout.getTitle());
	}

	@Test
	@Transactional
	void testUpdateWorkoutExerciseSet() {
		assertEquals(testWorkout.getWorkoutexercises().size(), 0);
		int numberOfWorkoutExercises = testWorkout.getWorkoutexercises().size();
		workoutService.addWorkoutExercise(testWorkout.getId(), testExercise1.getId());
		assertEquals(numberOfWorkoutExercises + 1, testWorkout.getWorkoutexercises().size());
		int numberOfWorkoutExerciseSets = testWorkout.getWorkoutexercises().get(0).getSets().size();
		assertEquals(numberOfWorkoutExerciseSets, 0);
		workoutService.addWorkoutExerciseSet(testExercise1.getId());
		assertEquals(numberOfWorkoutExerciseSets+1, testWorkout.getWorkoutexercises().get(0).getSets().size());
		
	}

	@Test
	@Transactional
	void testDeleteWorkoutExercise() {
		int numberOfWorkoutExercises = testWorkout.getWorkoutexercises().size();
		workoutService.addWorkoutExercise(testWorkout.getId(), testExercise1.getId());
		assertEquals(testWorkout.getWorkoutexercises().size(), numberOfWorkoutExercises + 1);
		workoutService.deleteWorkoutExercise(testWorkout, testExercise1.getId());
		assertEquals(testWorkout.getWorkoutexercises().size(), numberOfWorkoutExercises);
	}

}
