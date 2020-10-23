import React, { useEffect, useState } from "react";
import { Container, Card, CardImg, CardImgOverlay, Form, Row, FormGroup, Col, Input, Label, Button } from "reactstrap";

export default function Homepage() {

    const [background, setBackground] = useState("background-1.jpg");
    const [query, setQuery] = useState();
    const [location, setLocation] = useState();

    useEffect(() => {
        // Select random background image
        const num = (Math.floor(Math.random() * 4) + 1);
        setBackground(`background-${num}.jpg`);
    }, [])

    return (
        <Container fluid className="pt-5">
            <Card>
                <CardImg width="100%" src={require(`../media/${background}`)} alt="Welcome to Gearpatch" />
                <CardImgOverlay>
                    {/* Form frame */}
                    <Card width="100%" className="mt-5">
                    <Form>
                        <Row form>
                            <Col xs={12} sm={5}>
                                <FormGroup>
                                    <Input type="text" name="query" id="searchQuery" placeholder="guitar" />
                                    <Label for="serachQuery">What are you looking for?</Label>
                                </FormGroup>
                            </Col>
                            <Col xs={12} sm={5}>
                                <FormGroup>
                                    <Input type="text" name="location" id="searchLocation" placeholder="Nashville, TN" />
                                    <Label for="searchLocation">Where are you looking?</Label>
                                </FormGroup>
                            </Col>
                            <Col sm={2}>
                                <Button>Go</Button>
                            </Col>
                        </Row>
                    </Form>
                    </Card>
                </CardImgOverlay>
            </Card>

        </Container>
    );
}