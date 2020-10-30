import React from "react";
import { Modal, ModalHeader, ModalBody, ModalFooter, Button } from "reactstrap";

export default function UserConfirmation({ modal, toggle, user, saveUser }) {
    return (
        <Modal isOpen={modal} toggle={toggle} backdrop={true} keyboard={true}>
        <ModalHeader toggle={toggle}>Confirm User</ModalHeader>
            <ModalBody>
                <h4 className="text=center">Is this information correct?</h4>
                <p>{user.firstName} {user.LastName}</p>
                <p>Email: {user.email}</p>
                <p>Phone: {user.phone}</p>
                <p>Bio: {user.bio}</p>
                <p>Image Location: {user.imageLocation}</p>
            </ModalBody>
            <ModalFooter>
                <Button color="primary" onClick={saveUser}>Confirm</Button>{' '}
                <Button color="secondary" onClick={toggle}>Cancel</Button>
            </ModalFooter>
        </Modal>
    )
}

