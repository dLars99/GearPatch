import React from "react";
import { NumberOfDays } from "../Helpers/DateHelper";
import { Row, Col, Button } from "reactstrap";
import "../Gear/Gear.css"

export default function ({ reservation, currentUserId, prompt, composeMessage, cancelPrompt, returnPrompt }) {
    const totalPrice = NumberOfDays(reservation.startDate, reservation.endDate) * reservation.agreedPrice;

    const today = new Date();
    const startDate = new Date(reservation.startDate);

    // Set default images if no image present
    if (!reservation.gear.imageLocation) reservation.gear.imageLocation = 'null-gear.png'
    if (!reservation.owner.imageLocation) reservation.owner.imageLocation = "null-user.jpg"
    
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
                    <img className="rounded img-thumbnail gearListing--image" 
                        src={`/api/image/gear/${reservation.gear.imageLocation}`}
                        alt={reservation.gear.model} />
                </Col>
                <Col md={8}>
                    <Row>
                        <Col md={4}>
                            {reservation.ownerId === currentUserId
                            ? <p>Renter: {reservation.customer.fullName}</p>
                            : <p>Owner: {reservation.owner.fullName}</p>
                            }
                            <p>{reservation.gear.manufacturer} {reservation.gear.model}</p>
                        </Col>
                        <Col md={4}>
                            <p>Pickup Date: {reservation.startDate.substr(0, 10)}</p>
                            <p>Due Back By: {reservation.endDate.substr(0, 10)}</p>
                        </Col>
                        <Col md={4}>
                            {reservation.itemReturned
                            ? <p>Total</p>
                            : <p>Estimated Total</p>
                            }
                            <h3>${totalPrice}</h3>
                        </Col>
                    </Row>
                    <Row>
                        <Col md={2} />
                        <Col md={8}>

                            {reservation.ownerId === currentUserId
                            ? <>
                                    { !reservation.confirmed
                                    && <Button block color="primary" onClick={(evt) => prompt(evt, reservation)}>Confirm</Button>}
                                    { (reservation.confirmed && !reservation.itemReturned)
                                    && <Button block color="primary" onClick={(evt) => returnPrompt(evt, reservation)}>Mark Returned</Button>}
                                </>
                            : null}

                            <Button block onClick={(evt) => composeMessage(evt, reservation)}>Send Message</Button>

                            {(startDate > today)
                            ? <Button block color="danger" onClick={(evt) => cancelPrompt(evt, reservation)}>Cancel Reservation</Button>
                            : null}

                        </Col>
                        <Col md={2} />
                    </Row>
                </Col>
                <Col md={2} className="overflow-hidden">
                    <img height="160px" className="rounded img-thumbnail" 
                    src={`/api/image/user/${reservation.owner.imageLocation}`}
                    alt={reservation.owner.lastName} />
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

// 