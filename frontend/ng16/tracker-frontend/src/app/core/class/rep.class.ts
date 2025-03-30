import { RepCategory } from "../enums/rep-category";
import { Rep } from "../model/rep";

export class RepClass implements Rep {
    id: number;
    category: RepCategory;
    exerciseSetId: number;
    isEditing?: boolean;

    constructor(
        id: number,
        category: RepCategory,
        exerciseSetId: number,
        isEditing?: boolean,
    ) {
        this.id = id;
        this.category = category;
        this.exerciseSetId = exerciseSetId;
        this.isEditing = isEditing;
    }


}
