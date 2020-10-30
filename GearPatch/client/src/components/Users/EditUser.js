import React, { useContext, useState, useEffect } from "react";
import { UserProfileContext } from "../../providers/UserProfileProvider";

export default function EditUser({ history, currentUser }) {

    const {  } = useContext(UserProfileContext);

    const [newUser, setNewUser] = useState({});

    useEffect(() => {
        setNewUser(currentUser);
        // eslint-disable-next-line
    }, [])

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
                    <Label for="email">Email Address</Label>
                    <Input type="email" invalid={invalid.email} id="email" name="email" maxLength="255"
                        onChange={handleFieldChange} />
                    <FormFeedback>Email is required</FormFeedback>
                    <FormText>Your email will be used to sign in</FormText>
                </FormGroup>
                <FormGroup>
                    <Label for="phone">Phone Number</Label>
                    <Input type="phone" invalid={invalid.phone} id="phone" name="phone" maxLength="20"
                        onChange={handleFieldChange} />
                    <FormFeedback>Enter a valid phone number or leave blank</FormFeedback>
                    <FormText>Phone may be used for contact in future versions</FormText>
                </FormGroup>

                <FormGroup>
                    <Label for="imageLocation">Image Location</Label>
                    <Input type="url" invalid={invalid.imageLocation} id="imageLocation" name="imageLocation" maxLength="255"
                        onChange={handleFieldChange} />
                    <FormFeedback>Enter a valid URL</FormFeedback>
                    <FormText>Enter the URL of a picture to represent you</FormText>
                </FormGroup>

                <FormGroup>
                    <Label for="bio">Bio</Label>
                    <Input type="textarea" invalid={invalid.bio} id="bio" name="imageLocation"
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
            <UserConfirmation modal={confirm} toggle={confirmToggle} user={newUser} saveUser={saveUser} />
        </Container>
    )
}