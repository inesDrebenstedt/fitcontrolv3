
export interface Exercise {
    id?: number;
    title: string;
    description: string;
    primaryMuscleGroups: string[];
    secondaryMuscleGroups: string[];
    isEditing?: boolean;
  }
