import React from "react";
import { Col, Card, CardTitle, CardSubtitle, CardBody, CardText } from "reactstrap";

export default function OwnerDetails( {owner} ) {

    return (
        <Col xs={12} md={4}>
        <Card className="justify-content-center">
            <CardTitle className="text-center">
                <h2>{owner.firstName} {owner.lastName[0]}.</h2>
            </CardTitle>
            <CardSubtitle className="text-center">Owner</CardSubtitle>
            <div style={{width: "60%", borderRadius: "50%", margin: "0 auto"}}>
                <img src={owner.imageLocation} alt={owner.firstName} />
            </div>
            <CardBody>
                <CardText>{owner.bio}</CardText>
            </CardBody>
        </Card>
        </Col>
    )
}