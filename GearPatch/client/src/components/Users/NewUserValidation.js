export function NewUserValidation(newUser) {
    // All validations return a string indicating a failed field. No return if all fields valid.

    // First name is required
    if (!newUser.firstName || newUser.firstName.trim() === "") {
        return "firstName";
    }

    // Last name is required
    if (!newUser.lastName || newUser.lastName.trim() === "") {
        return "lastName";
    }

    // Phone must be a valid phone number
    // eslint-disable-next-line
    if (newUser.phone && !/^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im.test(newUser.phone)) {
        return "phone";
    }

    // ImageLocation must represent a valid image type
    const fileType = newUser.imageLocation.split(".").pop().toLowerCase();
    const validFileTypes = ["png", "bmp", "jpeg", "jpg", "gif"]
    if (!validFileTypes.includes(fileType)) {
        return "imageLocation";
    }
    
    // Email is required and valid
    // eslint-disable-next-line
    if (!newUser.email || newUser.email.trim() === "" ||
        !/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(newUser.email)) {
        return "email";
    }

    // Password is required and must match confirmation
    if (!newUser.password || newUser.password.trim() === "" || newUser.password !== newUser.confirm) {
        return "password";
    }

    return null;
}