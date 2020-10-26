import React, { useState, useContext } from "react";
import { UserProfileContext } from "../../providers/UserProfileProvider";
import { Modal, ModalHeader, ModalBody, ModalFooter, Form, FormGroup, Input, Label, Button } from "reactstrap";

export default function({ modal, toggle, startDate, endDate, gearName }) {

    const reservationSubmit = (evt) => {
    evt.preventDefault();
    // login(email, password)
    //     .then(() => modalToggle())
    //     .catch(() => alert("Invalid email or password"));
    };

    return (
        <Modal isOpen={modal} toggle={toggle} backdrop={true} keyboard={true}>
        <ModalHeader toggle={toggle}>Confirm Reservation</ModalHeader>
            <ModalBody>
                <h4 className="text=center">Request this reservation?</h4>
                <p>{gearName}</p>
                <p>Rental start: {startDate}</p>
                <p>Due back by: {endDate}</p>
            </ModalBody>
            <ModalFooter>
                <Button color="primary" onClick={reservationSubmit}>Confirm</Button>{' '}
                <Button color="secondary" onClick={toggle}>Cancel</Button>
            </ModalFooter>
        </Modal>
    )
}

