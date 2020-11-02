import React, { useEffect, useState } from "react";
import { useHistory } from "react-router-dom";
import { Card, CardImg, CardImgOverlay, Form, Row, FormGroup, Col, Input, Label, Button } from "reactstrap";


export default function Homepage() {

    const history = useHistory();

    const [background, setBackground] = useState("background-1.jpg");
    const [search, setSearch] = useState({query: "", location: ""});

    useEffect(() => {
        // Select random background image
        const num = (Math.floor(Math.random() * 4) + 1);
        setBackground(`background-${num}.jpg`);
    }, [])

    const handleFieldChange = (evt) => {
        setSearch({...search, [evt.target.name]: evt.target.value});
    }

    const submitForm = (evt) => {
        evt.preventDefault();
        history.push(`/gear/search/${search.query}`);

    }

    return (
            <Card width="100%">
                {/* Featured Background Image */}
                <CardImg height="100%" src={require(`../media/${background}`)} alt="Welcome to Gearpatch" />
                <CardImgOverlay>
                    {/* Form frame */}
                    <Card body className="mt-5 text-white" style={{backgroundColor: 'rgba(100, 100, 100, 0.5)'}}>
                    <Form onSubmit={submitForm}>
                        <Row form className="justify-content-center">
                            <Col xs={12} sm={10} lg={11}>
                                <FormGroup>
                                    <Input type="text" name="query" id="query" placeholder="guitar" 
                                        value={search.query} onChange={handleFieldChange} />
                                    <Label for="query">What are you looking for?</Label>
                                </FormGroup>
                            </Col>
                            {/* <Col xs={12} sm={5}>
                                <FormGroup>
                                    <Input type="text" name="location" id="location" placeholder="Nashville, TN" 
                                        value={search.location} onChange={handleFieldChange} />
                                    <Label for="location">Where are you looking?</Label>
                                </FormGroup>
                            </Col> */}
                            <Col sm={2} lg={1}>
                                <Button color="primary">Go</Button>
                            </Col>
                        </Row>
                    </Form>
                    </Card>
                </CardImgOverlay>
            </Card>
    );
}