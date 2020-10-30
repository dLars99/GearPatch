export function NewGearValidation(gear, gearType){

    // All validations return a string indicating a failed field. No return if all fields valid.

    // Headline is required
    if (!gear.headline || gear.headline.trim() === "") {
        return "headline";
    }

    // Manufacturer is required
    if (!gear.manufacturer || gear.manufacturer.trim() === "") {
        return "manufacturer"
    }

    // Model is required
    if (!gear.model || gear.model.trim() === "") {
        return "model"
    }

    // Price is required and must be a positive number
    if (!gear.price || gear.price < 1 || typeof gear.price !== "number") {
        return "price"
    }

    // ImageLocation must be a valid URL
    if (gear.imageLocation) {
        try {
            new URL(gear.imageLocation)
        } catch (_){
            return "imageLocation";
        }
    }

    // GearTypeId is required
    if (!gear.gearTypeId || gear.gearTypeId < 0 || typeof gear.gearTypeId !== "number") {
        return "gearTypeId"
    }

    // OptionNotes must be present for any gearType Option fields
    if (gearType.firstOptionName && (!gear.firstOptionNotes || gear.firstOptionNotes.trim() === "")) {
        return "firstOptionNotes";
    }

    if (gearType.secondOptionName && (!gear.secondOptionNotes || gear.secondOptionNotes.trim() === "")) {
        return "secondOptionNotes";
    }

}
