import { WeightUnit } from "../enums/weight-unit";
import { Rep } from "./rep";

export interface ExerciseSet {
    id?: number;
    weight: number;
    unit: WeightUnit;
    description: string;
    reps: Rep[];
    numberOfReps: number;
    workoutExerciseId: number;
    isEditing?: boolean;
  }