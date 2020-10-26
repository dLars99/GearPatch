import React, { useState, useContext } from "react";
import { useHistory } from "react-router-dom";
import { UserProfileContext } from "../../providers/UserProfileProvider";
import { Modal, ModalHeader, ModalBody, ModalFooter, Form, FormGroup, Input, Label, Button } from "reactstrap";

export default function({ modal, modalToggle }) {
    const history = useHistory();
    const { login } = useContext(UserProfileContext);

    const [email, setEmail] = useState();
    const [password, setPassword] = useState();

    const loginSubmit = (evt) => {
    evt.preventDefault();
    login(email, password)
        .then(() => modalToggle())
        .catch(() => alert("Invalid email or password"));
    };

    return (
        <Modal isOpen={modal} toggle={modalToggle} backdrop={"static"} keyboard={true}>
        <ModalHeader toggle={modalToggle}>Login to GearPatch</ModalHeader>
            <ModalBody>
                <Form>
                    <FormGroup>
                        <Input type="email" name="email" id="email" placeholder="dave@gearpatch.com"
                            onChange={(evt) => setEmail(evt.target.value)} />
                        <Label for="email">Email Address</Label>
                    </FormGroup>
                    <FormGroup>
                        <Input type="password" name="password" id="password"
                            onChange={(evt) => setPassword(evt.target.value)} />
                        <Label for="password">Password</Label>
                    </FormGroup>
                </Form>
            </ModalBody>
            <ModalFooter>
                <Button color="primary" onClick={loginSubmit}>Login</Button>{' '}
                <Button color="secondary" onClick={modalToggle}>Cancel</Button>
            </ModalFooter>
        </Modal>
    )
}

