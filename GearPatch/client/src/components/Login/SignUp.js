import React, { useContext, useState } from "react";
import { useHistory } from "react-router-dom";
import { UserProfileContext } from "../../providers/UserProfileProvider";
import { NewUserValidation } from "./NewUserValidation";
import { Container, Form, FormGroup, Input, Label, FormText, FormFeedback, Col, Row, Button } from "reactstrap";

export default function SignUp() {

    const { register } = useContext(UserProfileContext);

    const [newUser, setNewUser] = useState({});
    const [invalid, setInvalid] = useState({firstName: false, lastName: false, email: false, bio: false, 
        imageLocation: false});

    const history = useHistory();

    const handleFieldChange = (evt) => {
        const currentInvalid = { ...invalid };
        const userSoFar = { ...newGear };
        userSoFar[evt.target.id] = evt.target.value;
        setNewGear(userSoFar);
        // Reset field if it was previously marked invalid
        currentInvalid[evt.target.id] = false;
        setInvalid(currentInvalid);
    }

    const handleSubmit = (evt) => {
        evt.preventDefault();

        const userToSave = {
            firstName: newUser.firstName,
            lastName: newUser.lastName,
            email: newUser.email,
            phone: newUser.phone,
            bio: newUser.bio,
            imageLocation: newUser.imageLocation,
        }

        // Validation
        const fieldIsInvalid = NewUserValidation(userToSave);
        if (fieldIsInvalid) {
            const isInvalid = { ...invalid };
            isInvalid[fieldIsInvalid] = true;
            setInvalid(isInvalid);
        } else {
            register(userToSave)
            .then(() => history.push("/"));
        }
    }


    return (
        <Container>
            <h1 className="text-center">Register New User</h1>
            <Form>

                <FormGroup>
                    <Label for="firstName">First Name</Label>
                    <Input type="text" invalid={invalid.firstName} id="firstName" name="firstName" maxLength="40"
                        onChange={handleFieldChange} />
                    <FormFeedback>First name is required</FormFeedback>
                </FormGroup>
                <FormGroup>
                    <Label for="lastName">Last Name</Label>
                    <Input type="text" invalid={invalid.lastName} id="lastName" name="lastName" maxLength="40"
                        onChange={handleFieldChange} />
                    <FormFeedback>Last name is required</FormFeedback>
                    <FormText>Your full name will not be shown to other users</FormText>
                </FormGroup>

                <FormGroup>
                    <Label for="email">Email Address</Label>
                    <Input type="email" invalid={invalid.email} id="email" name="email" maxLength="40"
                        onChange={handleFieldChange} />
                    <FormFeedback>Email is required</FormFeedback>
                    <FormText>Your email will be used to sign in</FormText>
                </FormGroup>
                <FormGroup>
                    <Label for="phone">Last Name</Label>
                    <Input type="phone" invalid={invalid.phone} id="phone" name="phone" maxLength="40"
                        onChange={handleFieldChange} />
                    <FormFeedback>Enter a valid phone number or leave blank</FormFeedback>
                    <FormText>Phone may be used for contact in future versions</FormText>
                </FormGroup>

                <FormGroup>
                    <Label for="imageLocation">Image Location</Label>
                    <Input type="url" invalid={invalid.imageLocation} id="imageLocation" name="imageLocation" maxLength="40"
                        onChange={handleFieldChange} />
                    <FormFeedback>Enter a valid URL</FormFeedback>
                    <FormText>Enter the URL of a picture to represent you</FormText>
                </FormGroup>

                <FormGroup>
                    <Label for="bio">Bio</Label>
                    <Input type="textarea" invalid={invalid.bio} id="bio" name="imageLocation" maxLength="40"
                        onChange={handleFieldChange} />
                    <FormText>Tell other users a little about yourself</FormText>
                </FormGroup>

                <Row className="mt-3">
                    <Col xs={3} sm={2} lg={1}>
                        <Button onClick={handleSubmit}>Save</Button>
                    </Col>
                    <Col xs={9} sm={10} lg={11}>
                        <Button onClick={() => history.push("/")}>Back to Homepage</Button>
                    </Col>
                </Row>

            </Form>
        </Container>
    )
}