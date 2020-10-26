import React, { useContext, useState, useEffect } from "react";
import { UserProfileContext } from "../../providers/UserProfileProvider";
import { ReservationContext } from "../../providers/ReservationProvider";
import ConfirmReservation from "./ConfirmReservation";
import { Col, Card, CardTitle, CardBody, Form, FormGroup,
    Input, Label, FormFeedback, Row, Button } from "reactstrap";

export default function MakeReservation({ gear, history }) {

    const { isLoggedIn } = useContext(UserProfileContext);
    const { newReservation } = useContext(ReservationContext);

    const [startDate, setStartDate] = useState();
    const [endDate, setEndDate] = useState();
    const [invalid, setInvalid] = useState({startDate: false, endDate: false})
    const [isSending, setIsSending] = useState(false);
    const [confirmModal, setConfirmModal] = useState(false);
    const [today, setToday] = useState();

    const confirmToggle = () => setConfirmModal(!confirmModal);

    const completeReservation = (evt) => {
        evt.preventDefault();
        console.log(startDate, endDate)
        try {
            
            // Validation
            if (!startDate) {
                setInvalid({...invalid, startDate: true});
                throw("Enter a date to start the rental");
            } else if (!endDate) {
                setInvalid({...invalid, endDate: true});
                throw("Enter a date to return the rented item");
            } else if (!isLoggedIn) {
                throw("Please Sign Up or Sign In before making a reservation.");
            }

            const reservation = {
                ownerId = gear.ownerId,
                gearId = gear.id,
                agreedPrice = gear.price,
                startDate = startDate,
                endDate = endDate
            }

            setIsSending(true);
            newReservation(reservation).then(() => {
                confirmToggle();
                history.push("/");
            });
            
        } catch(err) {
            alert(err);
        }
    }

    useEffect(() => {
        const todayDate = new Date();
        setToday(`${todayDate.getFullYear()}-${todayDate.getMonth() + 1}-${todayDate.getDate()}`)
    }, [])

    const sendMessage = (evt) => {
        console.log("Message");
    }

    return (
        <Col xs={12} md={4}>
            <Card>
                <CardTitle className="text-center mt-4">
                    <h3>${gear.price} / day</h3>
                </CardTitle>
                <CardBody>
                    <Form>
                        <FormGroup>
                            <Input invalid={invalid.startDate} min={today} type="date" name="startDate" id="startDate" onChange={(e) => setStartDate(e.target.value)} />
                            <Label for="startDate">Check Out</Label>
                            <FormFeedback>Enter a date to start the rental.</FormFeedback>
                        </FormGroup>
                        <FormGroup>
                            <Input invalid={invalid.endDate} min={startDate} type="date" name="endDate" id="endDate" onChange={(e) => setEndDate(e.target.value)}/>
                            <Label for="endDate">Return</Label>
                            <FormFeedback>Enter a date to return the rented item.</FormFeedback>
                        </FormGroup>
                        <Row className="justify-content-center mb-3">
                            <Button onClick={completeReservation}>Request Reservation</Button>
                        </Row>
                        <Row className="justify-content-center">
                            <Button onClick={sendMessage}>Ask a Question</Button>
                        </Row>
                    </Form>
                </CardBody>
            </Card>
            <ConfirmReservation modal={confirmModal} toggle={confirmToggle} startDate={startDate} endDate={endDate} gearName={gear.manufacturer + gear.model} />
        </Col>
    )
}