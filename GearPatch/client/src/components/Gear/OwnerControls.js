import React, { useContext, useState } from "react";
import { useHistory } from "react-router-dom"
import { GearContext } from "../../providers/GearProvider";
import ActivationModal from "./ActivationModal";
import { Col, Card, CardBody, Row, Button } from "reactstrap";

export default function OwnerControls({ toggleEdit, isActive, gearId }) {

    const { toggleActivation } = useContext(GearContext);

    const [activeConfirmation, setActiveConfirmation] = useState(false);

    const history = useHistory();

    const toggleConfirmation = () => setActiveConfirmation(!activeConfirmation); 

    const confirmActivation = (evt) => {
        evt.preventDefault();
        toggleActivation(gearId).then(() => {
            toggleConfirmation();
            history.push(`/gear/${gearId}`)
        });
    }

    return (
        <Col xs={12} md={4}>
            <Card>
                <CardBody>
                    <Row>
                        <Button onClick={toggleEdit}>Edit</Button>
                    </Row>
                    <Row>
                        {isActive
                        ? <Button onClick={toggleConfirmation}>Deactivate</Button>
                        : <Button onClick={toggleConfirmation}>Reactivate</Button>
                        }
                    </Row>
                    <Row>
                        <Button color="danger">Delete Listing</Button>
                    </Row>
                </CardBody>
            </Card>
            <ActivationModal modal={activeConfirmation} toggle={toggleConfirmation} 
                confirmActivation={confirmActivation} />
        </Col>
    )
}

