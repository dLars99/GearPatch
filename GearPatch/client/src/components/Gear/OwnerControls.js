import React, { useContext, useState } from "react";
import { useHistory } from "react-router-dom"
import { GearContext } from "../../providers/GearProvider";
import ActivationModal from "./ActivationModal";
import DeletionModal from "./DeletionModal";
import { Col, Card, CardTitle, CardBody, Row, Button } from "reactstrap";

export default function OwnerControls({ toggleEdit, isActive, gearId }) {

    const { toggleActivation, deleteGear } = useContext(GearContext);

    const [activeConfirmation, setActiveConfirmation] = useState(false);
    const [activeDeletion, setActiveDeletion] = useState(false);

    const history = useHistory();

    const toggleConfirmation = () => setActiveConfirmation(!activeConfirmation); 
    const toggleDeletion = () => setActiveDeletion(!activeDeletion); 

    const confirmActivation = (evt) => {
        evt.preventDefault();
        toggleActivation(gearId).then(() => {
            toggleConfirmation();
            history.push(`/gear/${gearId}`);
        });
    }

    const confirmDeletion = (evt) => {
        evt.preventDefault();
        deleteGear(gearId).then(() => {
            toggleDeletion();
            history.push("/gear/mygear");
        });
    }

    return (
        <Col xs={12} md={4}>
            <Card>
                <CardTitle className="text-center">Owner Controls</CardTitle>
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
                        <Button color="danger" onClick={toggleDeletion}>Delete Listing</Button>
                    </Row>
                </CardBody>
            </Card>
            <ActivationModal modal={activeConfirmation} toggle={toggleConfirmation} 
                confirmDeletion={confirmActivation} />
            <DeletionModal modal={activeDeletion} toggle={toggleDeletion} 
                confirmDeletion={confirmDeletion} />
        </Col>
    )
}

