import React, { useContext, useState, useEffect } from "react";
import { UserProfileContext } from "../../providers/UserProfileProvider";
import { NewUserValidation } from "./NewUserValidation";
import UserConfirmation from "./UserConfirmation";
import { Container, Form, FormGroup, Input, Label, FormText, FormFeedback, Col, Row, Button } from "reactstrap";

export default function EditUser({ toggleEdit, history, currentUser }) {

    const { getToken, saveEditedUser, getUserProfile } = useContext(UserProfileContext);

    const [newUser, setNewUser] = useState();
    const [invalid, setInvalid] = useState({firstName: false, lastName: false, bio: false, 
        imageLocation: false });
    const [confirm, setConfirm] = useState(false);
    const [file, setFile] = useState();
    const [imagePreview, setImagePreview] = useState();
    const [previousImage, setPreviousImage] = useState();

    const confirmToggle = () => setConfirm(!confirm);

    const handleFieldChange = (evt) => {
        const currentInvalid = { ...invalid };
        const userSoFar = { ...newUser };
        userSoFar[evt.target.id] = evt.target.value;
        setNewUser(userSoFar);
        // Reset field if it was previously marked invalid
        currentInvalid[evt.target.id] = false;
        setInvalid(currentInvalid);
    }

    // Validate user information and request confirmation
    const handleSubmit = (evt) => {
        evt.preventDefault();

        // Validation
        const fieldIsInvalid = NewUserValidation(newUser);
        if (fieldIsInvalid && fieldIsInvalid !== "password" && fieldIsInvalid !== "email") {
            console.log("invalid")
            const isInvalid = { ...invalid };
            isInvalid[fieldIsInvalid] = true;
            setInvalid(isInvalid);
        } else {
            confirmToggle();
        }
    }

    const addFile = (evt) => {
        setFile(evt.target.files[0]);
        const currentUser = { ...newUser };
        currentUser[evt.target.id] = evt.target.files[0].name;
        setImagePreview(URL.createObjectURL(evt.target.files[0]));
        setNewUser(currentUser);
    }

    const saveImage = async (url) => {
        const formData = new FormData();
        formData.append("file", file, url);
        console.log(formData);
        const token = await getToken();
        const res = await fetch("/api/image/user", {
            method: "POST",
            headers: {
                Authorization: `Bearer ${token}`
            },
            body: formData
        });
         return res;
    }

    // Save information after user confirmation
    const saveUser = () => {
        const userToSave = {
            id: newUser.id,
            firstName: newUser.firstName,
            lastName: newUser.lastName,
            email: newUser.email,
            phone: newUser.phone,
            bio: newUser.bio || null,
            imageLocation: newUser.imageLocation,
            firebaseId: newUser.firebaseId,
            isActive: newUser.isActive
        }

        if (userToSave.imageLocation !== previousImage) {
            userToSave.imageLocation = `${new Date().getTime()}_${userToSave.imageLocation}`;
            saveImage(userToSave.imageLocation)
            .then((res) => {
                if (res.ok) {
                    saveEditedUser(userToSave)
                    .then(() => getUserProfile(userToSave.firebaseId))
                    .then((updatedUser) => {
                        sessionStorage.setItem("userProfile", JSON.stringify(updatedUser));
                        history.push("/")
                    });
                } else {
                    alert("An error occurred while uploading the image");
                }
            });
        } else {
            saveEditedUser(userToSave)
            .then(() => getUserProfile(userToSave.firebaseId))
            .then((updatedUser) => {
                sessionStorage.setItem("userProfile", JSON.stringify(updatedUser));
                history.push("/")
            });
        }
    }    

    useEffect(() => {
        setNewUser(currentUser);
        if (currentUser.imageLocation) {
            setImagePreview(`/api/image/user/${currentUser.imageLocation}`);
            setPreviousImage(currentUser.imageLocation);
        }
        // eslint-disable-next-line
    }, [])

    if (!newUser) {
        return null;
    }

    return (
        <Container>
            <h1 className="text-center">Edit User</h1>
            <Form>
                <FormGroup>
                    <Label for="firstName">First Name</Label>
                    <Input type="text" invalid={invalid.firstName} id="firstName" name="firstName" maxLength="40" value={newUser.firstName}
                        onChange={handleFieldChange} />
                    <FormFeedback>First name is required</FormFeedback>
                </FormGroup>
                <FormGroup>
                    <Label for="lastName">Last Name</Label>
                    <Input type="text" invalid={invalid.lastName} id="lastName" name="lastName" maxLength="40" value={newUser.lastName}
                        onChange={handleFieldChange} />
                    <FormFeedback>Last name is required</FormFeedback>
                    <FormText>Your full name will not be shown to other users</FormText>
                </FormGroup>

                <FormGroup>
                    <Label for="phone">Phone Number</Label>
                    <Input type="phone" invalid={invalid.phone} id="phone" name="phone" maxLength="20" value={newUser.phone}
                        onChange={handleFieldChange} />
                    <FormFeedback>Enter a valid phone number or leave blank</FormFeedback>
                    <FormText>Phone may be used for contact in future versions</FormText>
                </FormGroup>

                <FormGroup>
                    <Label for="imageLocation">Image</Label>
                    <Input type="file" accept="image/*" invalid={invalid.imageLocation} name="imageLocation" id="imageLocation" onChange={addFile} />
                    <FormFeedback>A valid image file is required for all users</FormFeedback>
                    <FormText>Upload a picture to represent you</FormText>
                </FormGroup>

                {imagePreview
                ? <FormGroup>
                    <img src={imagePreview} alt="preview" className="img-thumbnail" />
                </FormGroup>
                : null}

                <FormGroup>
                    <Label for="bio">Bio</Label>
                    <Input type="textarea" invalid={invalid.bio} id="bio" name="imageLocation" value={newUser.bio}
                        onChange={handleFieldChange} />
                    <FormText>Tell other users a little about yourself</FormText>
                </FormGroup>

                <Row className="mt-3">
                    <Col xs={3} sm={2} lg={1}>
                        <Button onClick={handleSubmit}>Save</Button>
                    </Col>
                    <Col xs={9} sm={10} lg={11}>
                        <Button onClick={toggleEdit}>Cancel</Button>
                    </Col>
                </Row>

            </Form>
            <UserConfirmation modal={confirm} toggle={confirmToggle} user={newUser} saveUser={saveUser} />
        </Container>
    )
}