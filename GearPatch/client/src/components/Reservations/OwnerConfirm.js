import React from "react";
import { Modal, ModalHeader, ModalBody, ModalFooter, Button } from "reactstrap";

export default function({ modal, toggle, confirm, id }) {

    return (
        <Modal isOpen={modal} toggle={toggle} backdrop={true} keyboard={true}>
        <ModalHeader toggle={toggle}>Confirmation</ModalHeader>
            <ModalBody>
                <h4 className="text-center">Confirm this reservation?</h4>
            </ModalBody>
            <ModalFooter>
                <Button color="primary" onClick={(evt) => confirm(evt, id)}>Confirm</Button>{' '}
                <Button color="secondary" onClick={toggle}>Cancel</Button>
            </ModalFooter>
        </Modal>
    )
}

// 

