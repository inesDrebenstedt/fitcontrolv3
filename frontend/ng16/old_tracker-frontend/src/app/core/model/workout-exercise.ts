import { Exercise } from "./exercise";
import { ExerciseSet } from "./exercise-set";
import { Workout } from "./workout";

export interface WorkoutExercise {
    id?: number;
    title: string;
    description: string;
    workout: Workout;
    primaryMuscleGroups: string[];
    secondaryMuscleGroups: string[];
    sets:  ExerciseSet[];
    referencedExercise: Exercise;
    isEditing?: boolean;
  }