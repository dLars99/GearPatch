import React, { useContext, useState, useEffect } from "react";
import { UserProfileContext } from "../../providers/UserProfileProvider";
import { NewUserValidation } from "./NewUserValidation";
import UserConfirmation from "./UserConfirmation";
import { Container, Form, FormGroup, Input, Label, FormText, FormFeedback, Col, Row, Button } from "reactstrap";

export default function EditUser({ toggleEdit, history, currentUser }) {

    const { saveEditedUser } = useContext(UserProfileContext);

    const [newUser, setNewUser] = useState();
    const [invalid, setInvalid] = useState({firstName: false, lastName: false, bio: false, 
        imageLocation: false });
    const [confirm, setConfirm] = useState(false);

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

    // Save information after user confirmation
    const saveUser = () => {
        const userToSave = {
            id: newUser.id,
            firstName: newUser.firstName,
            lastName: newUser.lastName,
            email: newUser.email,
            phone: newUser.phone,
            bio: newUser.bio,
            imageLocation: newUser.imageLocation,
            firebaseId: newUser.firebaseId,
            isActive: newUser.isActive
        }
        saveEditedUser(userToSave)
        .then(() => history.push("/"));
    }    

    useEffect(() => {
        setNewUser(currentUser);
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
                    <Label for="imageLocation">Image Location</Label>
                    <Input type="url" invalid={invalid.imageLocation} id="imageLocation" name="imageLocation" maxLength="255" 
                        value={newUser.imageLocation} onChange={handleFieldChange} />
                    <FormFeedback>Enter a valid URL</FormFeedback>
                    <FormText>Enter the URL of a picture to represent you</FormText>
                </FormGroup>

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