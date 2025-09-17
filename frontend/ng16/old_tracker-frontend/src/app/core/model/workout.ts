import { WorkoutExercise } from "./workout-exercise";

export interface Workout {
    id?: number;
	  workoutexercises: WorkoutExercise[];
	  title: string;
    date: Date;
    duration?: number; // Duration in minutes
    isEditing?: boolean;
  }