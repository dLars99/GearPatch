import React from "react";
import { Col, Card, CardTitle, CardSubtitle, CardBody, CardText } from "reactstrap";

export default function OwnerDetails( {owner} ) {

    if (!owner.imageLocation) owner.imageLocation = "null-user.jpg"

    return (
        <Col xs={12} md={4}>
        <Card className="justify-content-center">
            <CardTitle className="text-center">
                <h2>{owner.fullName}</h2>
            </CardTitle>
            <CardSubtitle className="text-center">Owner</CardSubtitle>
            <div style={{width: "60%", borderRadius: "50%", margin: ".5rem auto"}}>
                <img width="100%" src={`/api/image/user/${owner.imageLocation}`} 
                    alt={owner.fullName} className="rounded-circle"/>
            </div>
            <CardBody>
                <CardText>{owner.bio}</CardText>
            </CardBody>
        </Card>
        </Col>
    )
}