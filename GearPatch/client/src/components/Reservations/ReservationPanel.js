import React, { useContext, useState, useEffect } from "react";
import { ReservationContext } from "../../providers/ReservationProvider";
import Reservation from "./Reservation";
import OwnerConfirm from "./OwnerConfirm";
import MarkReturn from "./MarkReturn";
import { Row, Col } from "reactstrap";

export default function() {

    const [confirmModal, setConfirmModal] = useState(false);
    const [returnModal, setReturnModal] = useState(false);
    const [thisReservation, setThisReservation] = useState();

    const confirmToggle = () => setConfirmModal(!confirmModal);
    const returnToggle = () => setReturnModal(!returnModal);

    const { reservations, getByUser, saveConfirmation } = useContext(ReservationContext);

    const currentUserId = JSON.parse(sessionStorage.userProfile).id;

    const prompt = (evt, id) => {
        evt.preventDefault();
        setThisReservation(id);
        confirmToggle();
    }

    const confirm = (evt, id) => {
        evt.preventDefault();
        saveConfirmation(id).then(() => getByUser());
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
            <OwnerConfirm modal={confirmModal} toggle={confirmToggle} confirm={confirm} id={thisReservation} />
            <MarkReturn modal={returnModal} toggle={returnToggle} id={thisReservation} />
        </>
    )
}