
import { Workout } from "../model/workout";
import { WorkoutExercise } from "../model/workout-exercise";

export class WorkoutClass implements Workout {
    id?: number;
    workoutexercises: WorkoutExercise[];
    title: string;
    date: Date;
    duration?: number; // Duration in minutes
    isEditing?: boolean;

    constructor(
        id: number,
        workoutexercises: WorkoutExercise[],
        title: string,
        date: Date,
        duration?: number, // Duration in minutes
        isEditing?: boolean,
    ) {
        this.id = id;
        this.workoutexercises = workoutexercises;
        this.title = title;
        this.date = date;
        this.duration = duration;
        this.isEditing = isEditing;
    }


}
