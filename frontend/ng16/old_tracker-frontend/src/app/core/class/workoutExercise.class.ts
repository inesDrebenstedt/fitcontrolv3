import { Exercise } from "../model/exercise";
import { ExerciseSet } from "../model/exercise-set";
import { Workout } from "../model/workout";
import { WorkoutExercise } from "../model/workout-exercise";


export class WorkoutExerciseClass implements WorkoutExercise {
    id?: number;
    title: string;
    description: string;
    workout: Workout;
    primaryMuscleGroups: string[];
    secondaryMuscleGroups: string[];
    sets:  ExerciseSet[];
    referencedExercise: Exercise;
    isEditing?: boolean;

    constructor (    
        title: string,
        description: string,
        workout: Workout,
        primaryMuscleGroups: string[],
        secondaryMuscleGroups: string[],
        sets:  ExerciseSet[],
        referencedExercise: Exercise
    ){
        this.title = title;
        this.description = description;
        this.workout = workout;
        this.primaryMuscleGroups = primaryMuscleGroups;
        this.secondaryMuscleGroups = secondaryMuscleGroups;
        this.sets = sets;
        this.referencedExercise = referencedExercise;
    }

}