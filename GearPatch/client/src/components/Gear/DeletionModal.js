import React from "react";
import { Modal, ModalHeader, ModalBody, ModalFooter, Button } from "reactstrap";

export default function ActivationModal({ modal, toggle, confirmDeletion }) {
    return (
        <Modal isOpen={modal} toggle={toggle} backdrop={true} keyboard={true}>
        <ModalHeader toggle={toggle}>Confirm Activation Toggle</ModalHeader>
            <ModalBody>
                <h4 className="text-center">Are you sure?</h4>
                <p className="text-center">This action cannot be undone!</p>
            </ModalBody>
            <ModalFooter>
                <Button color="primary" onClick={confirmDeletion}>Confirm</Button>{' '}
                <Button color="secondary" onClick={toggle}>Cancel</Button>
            </ModalFooter>
        </Modal>    
    )
}