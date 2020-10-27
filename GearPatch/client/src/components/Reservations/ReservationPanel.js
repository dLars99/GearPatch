import React, { useContext, useState, useEffect } from "react";
import { ReservationContext } from "../../providers/ReservationProvider";
import { MessageContext } from "../../providers/MessageProvider";
import Reservation from "./Reservation";
import OwnerConfirm from "./OwnerConfirm";
import MarkReturn from "./MarkReturn";
import { ConfirmReservationMessage } from "../Messages/ReservationAutoMessages";
import { Row, Col } from "reactstrap";

export default function() {

    const [confirmModal, setConfirmModal] = useState(false);
    const [returnModal, setReturnModal] = useState(false);
    const [thisReservation, setThisReservation] = useState();

    const confirmToggle = () => setConfirmModal(!confirmModal);
    const returnToggle = () => setReturnModal(!returnModal);

    const { reservations, getByUser, saveConfirmation } = useContext(ReservationContext);
    const { sendMessage } = useContext(MessageContext);

    const currentUserId = JSON.parse(sessionStorage.userProfile).id;

    const prompt = (evt, reservation) => {
        evt.preventDefault();
        setThisReservation(reservation);
        confirmToggle();
    }

    const confirm = (evt, reservation) => {
        evt.preventDefault();
        saveConfirmation(reservation.id).then(() => {
            const confirmMessage = ConfirmReservationMessage(reservation);
            sendMessage(confirmMessage)
        }).then(() => getByUser());
        confirmToggle();
    }

    useEffect(() => {
        getByUser();
        // eslint-disable-next-line
    }, []);

    return (
        <>
            <Row className="mt-3">
                <Col sm={12} className="text-center">
                    <h1>Reservations</h1>
                </Col>
            </Row>
            {reservations.map(r => 
                <Reservation key={r.id} reservation={r} currentUserId={currentUserId} prompt={prompt} />
            )}
            <OwnerConfirm modal={confirmModal} toggle={confirmToggle} confirm={confirm} reservation={thisReservation} />
            <MarkReturn modal={returnModal} toggle={returnToggle} id={thisReservation} />
        </>
    )
}