import { RepCategory } from "../enums/rep-category";
import { Rep } from "../model/rep";

export class RepClass implements Rep {
    id?: number | undefined;
    category: RepCategory;
    exerciseSetId?: number | undefined;
    isEditing?: boolean;

    constructor(
        id: number | undefined, 
        category: RepCategory,
        exerciseSetId: number | undefined,
        isEditing?: boolean,
    ) {
        this.id = id ;
        this.category = category;
        this.exerciseSetId = exerciseSetId;
        this.isEditing = isEditing;
    }


}
