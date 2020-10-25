import React from "react";
import { Col, Card, CardTitle, CardBody, Form, FormGroup,
    Input, Label, Row, Button } from "reactstrap";

export default function MakeReservation({ gear }) {

    return (
        <Col xs={12} md={4}>
            <Card>
                <CardTitle className="text-center mt-4">
                    <h3>${gear.price} / day</h3>
                </CardTitle>
                <CardBody>
                    <Form>
                        <FormGroup>
                            <Input type="date" name="startDate" id="startDate" />
                            <Label for="startDate">Check Out</Label>
                        </FormGroup>
                        <FormGroup>
                            <Input type="date" name="endDate" id="endDate" />
                            <Label for="endDate">Return</Label>
                        </FormGroup>
                        <Row className="justify-content-center mb-3">
                            <Button>Request Reservation</Button>
                        </Row>
                        <Row className="justify-content-center">
                            <Button>Ask a Question</Button>
                        </Row>
                    </Form>
                </CardBody>
            </Card>
        </Col>
    )
}