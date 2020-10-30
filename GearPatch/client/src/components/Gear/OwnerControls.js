import React from "react";
import { Col, Card, CardBody, Row, Button } from "reactstrap";

export default function OwnerControls({ toggleEdit }) {

    return (
        <Col xs={12} md={4}>
            <Card>
                <CardBody>
                    <Row>
                        <Button onClick={toggleEdit}>Edit</Button>
                    </Row>
                    <Row>
                        <Button>Deactivate</Button>
                    </Row>
                    <Row>
                        <Button color="danger">Delete Listing</Button>
                    </Row>
                </CardBody>
            </Card>
        </Col>
    )
}

