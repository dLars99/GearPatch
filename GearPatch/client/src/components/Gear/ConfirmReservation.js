import React, { useContext } from "react";
import { useHistory } from "react-router-dom";
import { ReservationContext } from "../../providers/ReservationProvider";
import { Modal, ModalHeader, ModalBody, ModalFooter, Button } from "reactstrap";

export default function({ modal, toggle, startDate, endDate, total, gear, setIsSending }) {

    const { newReservation } = useContext(ReservationContext);

    const history = useHistory();

    const reservationSubmit = (evt) => {
        evt.preventDefault();
        const reservation = {
            ownerId: gear.userProfileId,
            gearId: gear.id,
            agreedPrice: gear.price,
            startDate: startDate,
            endDate: endDate
        }

        setIsSending(true);
        newReservation(reservation).then(() => {
            toggle();
            history.push("/reservations");
        });
    };

    return (
        <Modal isOpen={modal} toggle={toggle} backdrop={true} keyboard={true}>
        <ModalHeader toggle={toggle}>Confirm Reservation</ModalHeader>
            <ModalBody>
                <h4 className="text=center">Request this reservation?</h4>
                <p>{gear.manufacturer} {gear.model}</p>
                <p>Rental start: {startDate}</p>
                <p>Due back by: {endDate}</p>
                <p>Estimated total: ${total}</p>
            </ModalBody>
            <ModalFooter>
                <Button color="primary" onClick={reservationSubmit}>Confirm</Button>{' '}
                <Button color="secondary" onClick={toggle}>Cancel</Button>
            </ModalFooter>
        </Modal>
    )
}

