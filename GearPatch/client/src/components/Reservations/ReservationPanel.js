import React, { useContext, useState, useEffect } from "react";
import { ReservationContext } from "../../providers/ReservationProvider";
import { MessageContext } from "../../providers/MessageProvider";
import Reservation from "./Reservation";
import OwnerConfirm from "./OwnerConfirm";
import MarkReturn from "./MarkReturn";
import NewMessage from "../Messages/NewMessage";
import { ConfirmReservationMessage, CancelReservationMessage } from "../Messages/ReservationAutoMessages";
import { Row, Col } from "reactstrap";
import CancelReservation from "./CancelReservation";

export default function() {

    const { reservations, getByUser, saveConfirmation, deleteReservation, getUnconfirmed, saveReturn } = useContext(ReservationContext);
    const { sendMessage } = useContext(MessageContext);

    const [confirmModal, setConfirmModal] = useState(false);
    const [returnModal, setReturnModal] = useState(false);
    const [messageModal, setMessageModal] = useState(false);
    const [cancelModal, setCancelModal] = useState(false);
    const [thisReservation, setThisReservation] = useState();
    const [messageRecipient, setMessageRecipient] = useState();

    const confirmToggle = () => setConfirmModal(!confirmModal);
    const returnToggle = () => setReturnModal(!returnModal);
    const messageToggle = () => setMessageModal(!messageModal);
    const cancelToggle = () => setCancelModal(!cancelModal);

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
        }).then(() => getByUser())
        .then(() => getUnconfirmed());
        confirmToggle();
    }

    const returnPrompt = (evt, reservation) => {
        evt.preventDefault();
        setThisReservation(reservation);
        returnToggle();
    }

    const composeMessage = (evt, reservation) => {
        evt.preventDefault();
        setThisReservation(reservation);
        messageToggle();
    }

    const cancelPrompt = (evt, reservation) => {
        evt.preventDefault();
        setThisReservation(reservation);
        cancelToggle();
    }

    const cancelReservation = (evt, reservation) => {
        evt.preventDefault();

        deleteReservation(reservation.id)
        .then(() => {
            const cancelMessage = (currentUserId === reservation.ownerId)
                ? CancelReservationMessage(reservation.owner, reservation.customer, reservation)
                : CancelReservationMessage(reservation.customer, reservation.owner, reservation)
            sendMessage(cancelMessage)
        }).then(() => getByUser());
        cancelToggle();
    }

    const returnItem = (evt, reservation) => {
        evt.preventDefault();

        saveReturn(reservation.id)
        .then(() => getByUser());
        returnToggle();
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

    if (!reservations) return null;
    
    return (
        <>
            <Row className="mt-3">
                <Col sm={12} className="text-center">
                    <h1>Reservations</h1>
                </Col>
            </Row>
            {reservations.map(r => 
                <Reservation key={r.id} reservation={r} currentUserId={currentUserId} prompt={prompt} composeMessage={composeMessage} 
                    cancelPrompt={cancelPrompt} returnPrompt={returnPrompt} />
            )}
            <OwnerConfirm modal={confirmModal} toggle={confirmToggle} confirm={confirm} reservation={thisReservation} />
            <MarkReturn modal={returnModal} toggle={returnToggle} reservation={thisReservation} returnItem={returnItem} />
            <CancelReservation modal={cancelModal} toggle={cancelToggle} cancelReservation={cancelReservation} reservation={thisReservation} />
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