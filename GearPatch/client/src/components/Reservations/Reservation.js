import React from "react";
import { NumberOfDays } from "../Helpers/DateHelper";
import { Row, Col, Button } from "reactstrap";

export default function ({ reservation, currentUserId }) {

    const totalPrice = NumberOfDays(reservation.startDate, reservation.endDate) * reservation.agreedPrice;

    return (
        <>
            <Row className="my-4">
                <Col md={3} />
                <Col md={6}>
                    <hr />
                </Col>
                <Col md={3} />
            </Row>
            <Row>
                <Col md={2} className="overflow-hidden">
                    <img className="rounded img-thumbnail" src={reservation.gear.imageLocation} alt={reservation.gear.model} />
                </Col>
                <Col md={8}>
                    <Row>
                        <Col md={4}>
                            {reservation.ownerId === currentUserId
                            ? <p>Renter: {reservation.customer.firstName} {reservation.customer.lastName[0]}.</p>
                            : <p>Owner: {reservation.owner.firstName} {reservation.owner.lastName[0]}.</p>
                            }
                            <p>{reservation.gear.manufacturer} {reservation.gear.model}</p>
                        </Col>
                        <Col md={4}>
                            <p>Pickup Date: {reservation.startDate.substr(0, 10)}</p>
                            <p>Due Back By: {reservation.endDate.substr(0, 10)}</p>
                        </Col>
                        <Col md={4}>
                            <p>Estimated Total</p>
                            <h3>${totalPrice}</h3>
                        </Col>
                    </Row>
                    {reservation.ownerId === currentUserId
                    ? <Row>
                        <Col md={2} />
                        <Col md={8}>
                            { !reservation.isConfirmed
                            && <Button block>Confirm</Button>}
                            { (reservation.isConfirmed && !reservation.isReturned)
                            && <Button block>Mark Returned</Button>}
                        </Col>
                        <Col md={2} />
                    </Row>
                    : null
                    }
                </Col>
                <Col md={2} className="overflow-hidden">
                    <img height="160px" className="rounded img-thumbnail" src={reservation.owner.imageLocation} alt={reservation.owner.lastName} />
                </Col>
            </Row>
            <Row>
                <Col md={3} />
                <Col md={6}>
                    <hr />
                </Col>
                <Col md={3} />
            </Row>
        </>
    )
}