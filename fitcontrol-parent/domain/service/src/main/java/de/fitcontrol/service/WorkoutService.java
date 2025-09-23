package de.fitcontrol.service;


import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import de.fitcontrol.model.Exercise;
import de.fitcontrol.model.ExerciseSet;
import de.fitcontrol.model.Workout;
import de.fitcontrol.model.WorkoutExercise;
import de.fitcontrol.model.mapstruct.WorkoutMapper;
import de.fitcontrol.service.ports.ExerciseRepository;
import de.fitcontrol.service.ports.ExerciseSetRepository;
import de.fitcontrol.service.ports.RepRepository;
import de.fitcontrol.service.ports.WorkoutExerciseRepository;
import de.fitcontrol.service.ports.WorkoutRepository;
import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	
	public Workout findWorkoutByTitleAndCreationDate(String title, LocalDateTime creationTime) {
		List<Workout> workoutsByTitle = workoutRepo.findByTitle(title);	
		return workoutsByTitle.stream().filter(w -> w.getDate().equals(creationTime)).findFirst().orElse(null);
	}

	public Workout createWorkout(Workout workout) {
		
		Workout newWorkout = Workout.builder()
				.title(workout.getTitle())
				.duration(workout.getDuration())
				.date(workout.getDate())
				//.workoutexercises(workout.getWorkoutexercises())
				.build();
		System.out.println("-------------------1---------------------- create Workout called.");

		workoutRepo.save(newWorkout);
				
		System.out.println("-------------------2---------------------- create Workout called.");
				
		List<Workout> workoutsByTitle = workoutRepo.findByTitle(newWorkout.getTitle());
		workoutsByTitle.forEach(w -> {
	    	System.out.println("----A---- ");
			if(w.getDate().equals(newWorkout.getDate())) {
				System.out.println("----B---- ");
				Workout latestCreatedWorkout = w;
				
				if(workout.getWorkoutexercises().size() > 0) {
					System.out.println("----C---- ");
					workout.getWorkoutexercises().forEach(workoutexercise -> {
						System.out.println("----D---- ");
						WorkoutExercise we = WorkoutExercise.builder()
								.description(workoutexercise.getDescription())
								.referencedExercise(workoutexercise.getReferencedExercise())
								.workout(w)
								.build();
//						workoutexercise.setWorkout(latestCreatedWorkout);
			//			workoutexercise.getSets().forEach(set -> {
			//				set.getReps().forEach(rep -> {
			//					repRepo.save(rep);
			//				});
			//				exerciseSetRepo.save(set);
			//			});
						
						workoutExerciseRepo.save(we);
					});
				}
			}
		});
		
		return workout; //TODO: refine by date, title, and set of workoutexercises
	}

	public void deleteWorkoutById(Long workoutId) {
		workoutRepo.deleteById(workoutId);
	}

	public Workout updateWorkout(Workout incomingWorkout) {
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
		return workoutRepo.save(incomingWorkout);
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
	
	@Transactional
	public Workout saveWorkout(Workout workout) {
	    // Ensure new children have id = null
	    workout.getWorkoutexercises().forEach(ex -> {
	        if (ex.getId() == null) ex.setWorkout(workout);
	        ex.getSets().forEach(set -> {
	            if (set.getId() == null) set.setWorkoutexercise(ex);
	            set.getReps().forEach(rep -> {
	                if (rep.getId() == null) rep.setExerciseSet(set);
	            });
	        });
	    });

	    return workoutRepo.save(workout);
	}


	public Optional<Workout> patchWorkout(Workout incomingWorkout) {
//		Workout workoutFromDB = workoutRepo.findById(incomingWorkout.getId()).get();
//		// Use MapStruct to map fields
//		WorkoutMapper.INSTANCE.updateWorkoutFromDto(incomingWorkout, workoutFromDB);
//
//		// Save the updated workout
//		return workoutRepo.save(workoutFromDB);
		
		
		 return workoutRepo.findById(incomingWorkout.getId()).map(workoutFromDB -> {
			 WorkoutMapper.INSTANCE.updateWorkoutFromDto(incomingWorkout, workoutFromDB);
		        return workoutRepo.save(workoutFromDB);
		    });
	}

	public Workout deleteWorkoutExercise(Workout workout, Long workoutExerciseId) {
//		workout.getWorkoutexercises().removeIf(exercise -> exercise.getId().equals(workoutExerciseId));
//		saveWorkout(workout);

		workoutExerciseRepo.deleteById(workoutExerciseId);
		return workout;
	}

	@Transactional
	public void saveWorkoutExerciseSet(Long workoutExerciseId, ExerciseSet set) {

		System.out.println("----------------- workoutExerciseId " + workoutExerciseId
		+ ", " + set.toString());
		
		WorkoutExercise workoutExercise = workoutExerciseRepo.findById(workoutExerciseId).orElseThrow();
		Workout workout = workoutRepo.getById(workoutExercise.getWorkout().getId());
		
		set.builder().workoutexercise(workoutExercise).build();
		if (workoutExercise.getSets().stream().noneMatch(s -> s.getId().equals(set.getId()))) {
			//set doesnt exist yet in workoutexercise
			ExerciseSet newSet = ExerciseSet.builder()
					.numberOfReps(set.getNumberOfReps())
					.reps(set.getReps())
					.workoutexercise(workoutExercise)
					.description(set.getDescription())
					.weight(set.getWeight())
					.unit(set.getUnit())
					.build();
			workoutExercise.getSets().add(newSet);
			exerciseSetRepo.save(newSet);
			workoutExerciseRepo.save(workoutExercise);
			
			workoutRepo.save(workout);

		} else {
			exerciseSetRepo.save(set);
		}
		
//	
//		System.out.println("---------- set id: " + set.getId());
//		
//		WorkoutExercise workoutExercise = workoutExerciseRepo.findById(workoutExerciseId).orElseThrow();
//		System.out.println("---------- workoutExercise.getId(): " + workoutExercise.getId());
//		Workout workout = workoutRepo.getById(workoutExercise.getWorkoutId());
//		
////		set.setWorkoutexercise(workoutExercise);
////		exerciseSetRepo.save(set);
////		
////		workoutExercise.getSets().add(set);
////		workoutExerciseRepo.save(workoutExercise);
//
//		
//		if (set.getId() == 1) {
//			ExerciseSet newSet = ExerciseSet.builder()
//					.id(set.getId())
//					.description(set.getDescription())
//					.numberOfReps(set.getNumberOfReps())
//					.reps(set.getReps())
//					.workoutexercise(workoutExercise)
//					.build();
//			
//			workout.getWorkoutexercises().add(workoutExercise);
//			workoutExercise.getSets().add(newSet);
//			workoutExerciseRepo.save(workoutExercise);
//			//exerciseSetRepo.save(newSet);
//			
////			set.setWorkoutexercise(workoutExercise);
////			exerciseSetRepo.save(set);
////			for (int i = 0; i < set.getNumberOfReps(); i++) {
////				set.getReps().add(new Rep().builder().category(RepCategory.full_ROM).exerciseSet(set).build());
////			}
////			workoutExercise.getSets().add(set);
////			workoutExerciseRepo.save(workoutExercise);
//			
//		} else {
////			ExerciseSet setFromDB = exerciseSetRepo.findById(set.getId()).orElseThrow();
////
////			set.setWorkoutexercise(workoutExercise);
////			workoutExercise.getSets().remove(setFromDB);
////			workoutExercise.getSets().add(set);
////			ExerciseSetMapper.INSTANCE.updateExerciseSetFromDto(set, setFromDB);
////
////			workoutExerciseRepo.save(workoutExercise);
////			exerciseSetRepo.save(set);
//		}
	}

	public void deleteExerciseSet(Long setId, Long workoutExerciseId) {
//		WorkoutExercise workoutExercise = workoutExerciseRepo.findById(workoutExerciseId).orElseThrow();
		ExerciseSet setFromDB = exerciseSetRepo.findById(setId).orElseThrow();
//		workoutExerciseRepo.save(workoutExercise);
		exerciseSetRepo.delete(setFromDB);
	}

//	public Optional<Workout> patchWorkout(Workout patchWorkout) {
//	    return workoutRepo.findById(patchWorkout.getId()).map(workout -> {
//	        if (patchWorkout.getTitle() != null) workout.setTitle(patchWorkout.getTitle());
//	        if (patchWorkout.getDuration() != null) workout.setDuration(patchWorkout.getDuration());
//	        return workoutRepo.save(workout);
//	    });
//	}

	public List<Workout> showAllWorkouts() {
		return workoutRepo.findAll();
	}

	public List<Workout> showAllWorkoutsOf(String userName) {
		//TODO: raus nach Tests
		log.atDebug().log("-----------showAllWorkoutsOf----------> " + userName);
		return workoutRepo.findAll().stream().filter( workout -> 
			workout.getAppUser().getUserName().equals(userName)
		).toList();
	}

}
