import React, { useState } from "react";
import Activation from "./Activation";
import { Row, Col, Card, CardImg, CardBody, CardTitle, CardSubtitle, CardText, CardFooter, Button } from "reactstrap";


export default function UserDetails({ toggleEdit, currentUser, history }) {

    const [activation, setActivation] = useState(false);
    
    const toggleActivation = () => setActivation(!activation);

    return (
        <Row className="justify-content-center">
            <Col md={8} xl={5} >
                <Card>
                    <CardImg top width="100%" 
                src={`/api/image/user/${currentUser.imageLocation}`} 
                alt={currentUser.fullName} />
                    <CardBody>
                        <CardTitle className="text-center">{currentUser.fullName}</CardTitle>
                        <CardSubtitle className="text-center">{currentUser.isActive ? `(${currentUser.fullName})` : 'INACTIVE'}</CardSubtitle>
                        <CardText>Email: {currentUser.email}</CardText>
                        <CardText>Phone: {currentUser.phone}</CardText>
                        <CardText>Bio: {currentUser.bio}</CardText>
                    </CardBody>
                    <CardFooter>
                        <Row>
                            <Col md={4}>
                                <Button color="primary" onClick={toggleEdit} disabled={!currentUser.isActive}>Edit</Button> {' '}
                            </Col>
                            <Col md={4} lg={5}>
                                {currentUser.isActive
                                ? <><Button color="danger" onClick={() => toggleActivation()}>Deactivate</Button> {' '}</>
                                : <><Button color="danger" onClick={() => toggleActivation()}>Reactivate</Button> {' '}</>
                                }
                            </Col>
                            <Col md={4} lg={3}>
                                <Button onClick={() => history.goBack()}>Go Back</Button>
                            </Col>
                        </Row>
                    </CardFooter>
                </Card>
            </Col>
            <Activation modal={activation} toggle={toggleActivation} currentUser={currentUser} history={history} />
        </Row>
    )
}
