import React from "react";
import { Modal, ModalHeader, ModalBody, ModalFooter, Button } from "reactstrap";

export default function ActivationModal({ modal, toggle, confirmActivation }) {
    return (
        <Modal isOpen={modal} toggle={toggle} backdrop={true} keyboard={true}>
        <ModalHeader toggle={toggle}>Confirm Activation Toggle</ModalHeader>
            <ModalBody>
                <h4 className="text=center">Are you sure?</h4>
            </ModalBody>
            <ModalFooter>
                <Button color="primary" onClick={confirmActivation}>Confirm</Button>{' '}
                <Button color="secondary" onClick={toggle}>Cancel</Button>
            </ModalFooter>
        </Modal>    
    )
}