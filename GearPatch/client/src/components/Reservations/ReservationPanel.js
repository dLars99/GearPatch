import React, { useContext, useState, useEffect } from "react";
import { ReservationContext } from "../../providers/ReservationProvider";
import Reservation from "./Reservation";
import { Row, Col } from "reactstrap";

export default function() {

    const { reservations, getByUser } = useContext(ReservationContext);

    const currentUserId = JSON.parse(sessionStorage.userProfile).id;

    useEffect(() => {
        getByUser();
    }, []);

    return (
        <>
            <Row className="mt-3">
                <Col sm={12} className="text-center">
                    <h1>Reservations</h1>
                </Col>
            </Row>
            {reservations.map(r => 
                <Reservation key={r.id} reservation={r} currentUserId={currentUserId} />
            )}
        </>
    )
}