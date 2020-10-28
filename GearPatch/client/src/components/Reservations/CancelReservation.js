import React from "react";
import { Modal, ModalHeader, ModalBody, ModalFooter, Button } from "reactstrap";

export default function ({ modal, toggle, cancelReservation, reservation }) {
    
    return (
        <Modal isOpen={modal} toggle={toggle} backdrop={true} keyboard={true}>
        <ModalHeader toggle={toggle}>Cancel Reservation</ModalHeader>
            <ModalBody>
                <h4 className="text-center">Are you sure you want to cancel this reservation?</h4>
                <p>This cannot be undone.</p>
            </ModalBody>
            <ModalFooter>
                <Button color="primary" onClick={(evt) => cancelReservation(evt, reservation)}>Confirm Cancellation</Button>{' '}
                <Button color="secondary" onClick={toggle}>Do Not Cancel</Button>
            </ModalFooter>
        </Modal>
    )
}