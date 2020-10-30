export function NewUserValidation({ newUser }) {
    
    // All validations return a string indicating a failed field. No return if all fields valid.

    // First name is required
    if (!newUser.firstName || newUser.firstName.trim() === "") {
        return "firstName";
    }

    // Last name is required
    if (!newUser.lastName || newUser.lastName.trim() === "") {
        return "lastName"
    }

    // Email is required and valid
    if (!newUser.email || newUser.email.trim() === "" ||
        !/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(newGear.email)) {
        return "email"
    }

    // Phone must be a valid phone number
    if (newGear.phone && !/^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im.test(newGear.phone)) {
        return "phone"
    }

    // ImageLocation must be a valid URL
    if (newUser.imageLocation) {
        try {
            new URL(newUser.imageLocation)
        } catch (_){
            return "imageLocation";
        }
    }
    
    return null;
}