import React, { useState, useContext } from "react";
import { useHistory } from "react-router-dom";
import { UserProfileContext } from "../../providers/UserProfileProvider";
import { Modal, ModalHeader, ModalBody, ModalFooter, Form, FormGroup, Input, Label, Button } from "reactstrap";

export default function({ modal, modalToggle }) {
    const history = useHistory();
    const { login } = useContext(UserProfileContext);

    const [email, setEmail] = useState();
    const [password, setPassword] = useState();

    const loginSubmit = (e) => {
    e.preventDefault();
    login(email, password)
        .then(() => history.push("/"))
        .catch(() => alert("Invalid email or password"));
    };

    return (
        <Modal isOpen={modal} toggle={modalToggle} backdrop={"static"} keyboard={true}>
        <ModalHeader toggle={modalToggle}>Login to GearPatch</ModalHeader>
            <ModalBody>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            </ModalBody>
            <ModalFooter>
                <Button color="primary" onClick={loginSubmit}>Login</Button>{' '}
                <Button color="secondary" onClick={modalToggle}>Cancel</Button>
            </ModalFooter>
        </Modal>
    )
}

