import React, { useContext, useState } from "react";
import { UserProfileContext } from "../../providers/UserProfileProvider";
import { Col, Card, CardTitle, CardBody, Form, FormGroup,
    Input, Label, FormFeedback, Row, Button } from "reactstrap";

export default function MakeReservation({ gear }) {

    const { isLoggedIn } = useContext(UserProfileContext);

    const [startDate, setStartDate] = useState();
    const [endDate, setEndDate] = useState();
    const [invalid, setInvalid] = useState({startDate: false, endDate: false})

    const completeReservation = (evt) => {
        evt.preventDefault();
        console.log("Click")
        if (!startDate) {
            setInvalid({...invalid, startDate: true});
        } else if (!endDate) {
            setInvalid({...invalid, endDate: true});
        } else if (!isLoggedIn) {
            alert("Sign Up or Sign In to make a reservation.");
        } else {
            alert("Hey there, beautiful!");
        }
    }

    const sendMessage = (evt) => {

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
                            <Input invalid={invalid.startDate} type="date" name="startDate" id="startDate" onChange={(e) => setStartDate(e.target.value)} />
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
        </Col>
    )
}