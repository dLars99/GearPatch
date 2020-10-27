import React, { useContext, useState, useEffect } from "react";
import { ReservationContext } from "../../providers/ReservationProvider";
import { MessageContext } from "../../providers/MessageProvider";
import Reservation from "./Reservation";
import OwnerConfirm from "./OwnerConfirm";
import MarkReturn from "./MarkReturn";
import NewMessage from "../Messages/NewMessage";
import { ConfirmReservationMessage } from "../Messages/ReservationAutoMessages";
import { Row, Col } from "reactstrap";

export default function() {

    const { reservations, getByUser, saveConfirmation } = useContext(ReservationContext);
    const { sendMessage } = useContext(MessageContext);

    const [confirmModal, setConfirmModal] = useState(false);
    const [returnModal, setReturnModal] = useState(false);
    const [messageModal, setMessageModal] = useState(false);
    const [thisReservation, setThisReservation] = useState();
    const [messageRecipient, setMessageRecipient] = useState();

    const confirmToggle = () => setConfirmModal(!confirmModal);
    const returnToggle = () => setReturnModal(!returnModal);
    const messageToggle = () => setMessageModal(!messageModal);

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

    const composeMessage = (evt, reservation) => {
        evt.preventDefault();
        setThisReservation(reservation);
        messageToggle();
    }

    useEffect(() => {
        getByUser()
        // eslint-disable-next-line
    }, []);

    useEffect(() => {
        if (reservations.length > 0) {
            setThisReservation(reservations[0]);
        }
    }, [reservations])

    useEffect(() => {
        if (thisReservation) {
            setMessageRecipient((thisReservation.ownerId === currentUserId) ? thisReservation.customer : thisReservation.owner)
        }
        // eslint-disable-next-line
    }, [thisReservation])

    return (
        <>
            <Row className="mt-3">
                <Col sm={12} className="text-center">
                    <h1>Reservations</h1>
                </Col>
            </Row>
            {reservations.map(r => 
                <Reservation key={r.id} reservation={r} currentUserId={currentUserId} prompt={prompt} composeMessage={composeMessage} />
            )}
            <OwnerConfirm modal={confirmModal} toggle={confirmToggle} confirm={confirm} reservation={thisReservation} />
            <MarkReturn modal={returnModal} toggle={returnToggle} reservation={thisReservation} />
            {console.log(thisReservation)}
            {thisReservation && messageRecipient
            ? <NewMessage modal={messageModal} toggle={messageToggle}
                name={`${messageRecipient.firstName} ${messageRecipient.lastName}`}
                item={`${thisReservation.gear.manufacturer} ${thisReservation.gear.model}`}
                recipientId={messageRecipient.id} 
            />
            : null
            }
        </>
    )
}