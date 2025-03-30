package de.fitcontrol.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import de.fitcontrol.model.Exercise;
import de.fitcontrol.model.ExerciseSet;
import de.fitcontrol.model.Rep;
import de.fitcontrol.model.Workout;
import de.fitcontrol.model.WorkoutExercise;
import de.fitcontrol.model.enums.RepCategory;
import de.fitcontrol.model.mapstruct.WorkoutMapper;
import de.fitcontrol.service.ports.ExerciseRepository;
import de.fitcontrol.service.ports.ExerciseSetRepository;
import de.fitcontrol.service.ports.RepRepository;
import de.fitcontrol.service.ports.WorkoutExerciseRepository;
import de.fitcontrol.service.ports.WorkoutRepository;


@Service
public class WorkoutService {

	@Autowired
	WorkoutRepository workoutRepo;
	@Autowired
	WorkoutExerciseRepository workoutExerciseRepo;
	@Autowired
	ExerciseRepository exerciseRepo;
	@Autowired
	ExerciseSetRepository exerciseSetRepo;
	@Autowired
	RepRepository repRepo;

	public Workout createWorkout(Workout workout) {
		
		Workout newWorkout = Workout.builder()
				.title(workout.getTitle())
				.duration(workout.getDuration())
				.date(workout.getDate())
				.build();
		
				workoutRepo.save(newWorkout);
				
				
		Workout savedWorkout = workoutRepo.findByDate(newWorkout.getDate()).get(0);
		
		workout.getWorkoutexercises().forEach(workoutexercise -> {
			workoutexercise.setWorkout(savedWorkout);
//			workoutexercise.getSets().forEach(set -> {
//				set.getReps().forEach(rep -> {
//					repRepo.save(rep);
//				});
//				exerciseSetRepo.save(set);
//			});
			
			workoutExerciseRepo.save(workoutexercise);
		});
		
		
		System.out.println("---+++--- " + workoutRepo.findAll()
		.stream().filter(w -> w.getTitle().equals(workout.getTitle())).findFirst().get().toString());
		
		return savedWorkout; //TODO: refine by date, title, and set of workoutexercises
	}

	public void deleteWorkoutById(Long workoutId) {
		workoutRepo.deleteById(workoutId);
	}

	public Workout updateWorkout(Workout updatedWorkout) {
		// TODO: aufräumen
//		System.out.println("WorkoutService updateWorkout() called");
		/*
		Long workoutExerciseid = 0L;

		updatedWorkout.getWorkoutExercises().forEach(ex -> {
			ex.getSets().forEach(set -> {
				set.getReps().forEach(rep -> {

				});
			});
		});
		*/

		return workoutRepo.save(updatedWorkout);
	}

	public Workout addWorkoutExercise(Long workoutId, Long exerciseId) {

		Workout workoutToUpdate = workoutRepo.findById(workoutId).get();
		Exercise chosenExercise = exerciseRepo.findById(exerciseId).get();

		WorkoutExercise newWorkoutExercise = WorkoutExercise.builder().description("")
				.referencedExercise(chosenExercise).sets(null).title(chosenExercise.getTitle()).workout(workoutToUpdate)
				.build();
		workoutExerciseRepo.save(newWorkoutExercise);

		workoutToUpdate.getWorkoutexercises().add(newWorkoutExercise);

		return workoutRepo.save(workoutToUpdate);
	}

	public Workout addWorkoutExerciseSet(Long workoutExerciseId) {
		// TODO Auto-generated method stub
		WorkoutExercise workoutExercise = workoutExerciseRepo.findById(workoutExerciseId).get();
		ExerciseSet newSet = new ExerciseSet();
		newSet.setWorkoutexercise(workoutExercise);
		workoutExercise.getSets().add(newSet);

		workoutExerciseRepo.save(workoutExercise);

		WorkoutExercise test = workoutExerciseRepo.findById(workoutExerciseId).get();
		test.getSets().forEach(i -> System.out.println("++++++++++++++++++++++++ found set!"));
		return workoutRepo.save(workoutExercise.getWorkout());

	}

	public void saveWorkout(Workout incomingWorkout) {
		Workout workoutFromDB = workoutRepo.findById(incomingWorkout.getId()).get();
		// Use MapStruct to map fields
		WorkoutMapper.INSTANCE.updateWorkoutFromDto(incomingWorkout, workoutFromDB);

		// Save the updated workout
		workoutRepo.save(workoutFromDB);
	}

	public Workout deleteWorkoutExercise(Workout workout, Long workoutExerciseId) {
//		workout.getWorkoutexercises().removeIf(exercise -> exercise.getId().equals(workoutExerciseId));
//		saveWorkout(workout);

		workoutExerciseRepo.deleteById(workoutExerciseId);
		return workout;
	}

	@Transactional
	public void saveWorkoutExerciseSet(Long workoutExerciseId, ExerciseSet set) {
		// TODO Auto-generated method stub

		System.out.println("----------------- fuck this: " + set.toString());
	
		System.out.println("---------- set id: " + set.getId());
		WorkoutExercise workoutExercise = workoutExerciseRepo.findById(workoutExerciseId).orElseThrow();
		if (set.getId() == 0) {
			set.setWorkoutexercise(workoutExercise);
			for (int i = 0; i < set.getNumberOfReps(); i++) {
				set.getReps().add(new Rep().builder().category(RepCategory.full_ROM).exerciseSet(set).build());
			}
			workoutExercise.getSets().add(set);
			workoutExerciseRepo.save(workoutExercise);
		} else {
//			ExerciseSet setFromDB = exerciseSetRepo.findById(set.getId()).orElseThrow();
//
//			set.setWorkoutexercise(workoutExercise);
//			workoutExercise.getSets().remove(setFromDB);
//			workoutExercise.getSets().add(set);
//			ExerciseSetMapper.INSTANCE.updateExerciseSetFromDto(set, setFromDB);
//
//			workoutExerciseRepo.save(workoutExercise);
			exerciseSetRepo.save(set);
		}
	}

	public void deleteExerciseSet(Long setId, Long workoutExerciseId) {
//		WorkoutExercise workoutExercise = workoutExerciseRepo.findById(workoutExerciseId).orElseThrow();
		ExerciseSet setFromDB = exerciseSetRepo.findById(setId).orElseThrow();
//		workoutExerciseRepo.save(workoutExercise);
		exerciseSetRepo.delete(setFromDB);
	}

}
