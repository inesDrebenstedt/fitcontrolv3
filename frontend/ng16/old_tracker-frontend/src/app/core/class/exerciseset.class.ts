import { WeightUnit } from "../enums/weight-unit";
import { ExerciseSet } from "../model/exercise-set";
import { Rep } from "../model/rep";
import { WorkoutExercise } from "../model/workout-exercise";

export class ExerciseSetClass implements ExerciseSet {
    id?: number;
    weight: number;
    unit: WeightUnit;
    description: string;
    reps: Rep[];
    numberOfReps: number;
    workoutExerciseId!: number;
    isEditing: boolean;

    constructor(
        id: number | undefined, 
        weight: number, 
        unit: WeightUnit, 
        description: string, 
        reps: Rep[],
        numberOfReps: number,
        workoutExerciseId: number,
        isEditing: boolean
    ) {
        this.id = id;
        this.weight = weight;
        this.unit = unit;
        this.description = description;
        this.reps = reps;
        this.numberOfReps = numberOfReps;
        this.workoutExerciseId = workoutExerciseId;
        this.isEditing = isEditing;
    }


}
