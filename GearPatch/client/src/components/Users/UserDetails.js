import React from "react";
import { Row, Col, Card, CardImg, CardBody, CardTitle, CardSubtitle, CardText, CardFooter, Button } from "reactstrap";


export default function UserDetails({ toggleEdit, currentUser, history }) {

    return (
        <Row className="justify-content-center">
            <Col md={8} xl={5} >
                <Card>
                    <CardImg top width="100%" src={currentUser.imageLocation} alt={currentUser.fullName} />
                    <CardBody>
                        <CardTitle className="text-center">{currentUser.firstName} {currentUser.lastName}</CardTitle>
                        <CardSubtitle className="text-center">({currentUser.fullName})</CardSubtitle>
                        <CardText>Email: {currentUser.email}</CardText>
                        <CardText>Phone: {currentUser.phone}</CardText>
                        <CardText>Bio: {currentUser.bio}</CardText>
                    </CardBody>
                    <CardFooter>
                        <Row>
                            <Col md={4} lg={5}>
                                <Button onClick={toggleEdit}>Edit</Button> {' '}
                            </Col>
                            <Col md={4} lg={5}>
                                <Button>Deactivate</Button> {' '}
                            </Col>
                            <Col md={4} lg={2}>
                                <Button onClick={() => history.goBack()}>Go Back</Button>
                            </Col>
                        </Row>

                        </CardFooter>
                </Card>
            </Col>
        </Row>
    )
}
