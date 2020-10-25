import React from "react";
import { Col, Card } from "reactstrap";

export default function OwnerDetails( {owner} ) {

    return (
        <Col xs={12} md={4}>
        <Card>
            <h2>{owner.firstName} {owner.lastName[0]}.</h2>
        </Card>
        </Col>
    )
}