import { MuscleGroup } from "../enums/muscle-group";
import { WeightUnit } from "../enums/weight-unit";
import { Exercise } from "../model/exercise";
import { ExerciseSet } from "../model/exercise-set";
import { Rep } from "../model/rep";
import { WorkoutExercise } from "../model/workout-exercise";

export class ExerciseClass implements Exercise {
    id: number;
    title: string;
    description: string;
    primaryMuscleGroups: MuscleGroup[];
    secondaryMuscleGroups: MuscleGroup[];


    constructor(
        id: number, 
        title: string,
        description: string, 
        primaryMuscleGroups: MuscleGroup[],
        secondaryMuscleGroups: MuscleGroup[]
    ) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.primaryMuscleGroups = primaryMuscleGroups;
        this.secondaryMuscleGroups = secondaryMuscleGroups;
    }


}
