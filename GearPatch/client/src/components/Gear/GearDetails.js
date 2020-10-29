import React from "react";
import { useHistory } from "react-router-dom";
import { Col, Button } from "reactstrap";

export default function GearDetails({ gear }) {

    const history = useHistory();

    return (
        <Col xs={12} md={8}>
            <Button type="button" onClick={() => history.goBack()}>Back to list</Button>
            <h1>{gear.headline}</h1>
            <h2>{gear.manufacturer} {gear.model}</h2>
            <p>{gear.description}</p>
            {gear.gearType.firstOptionName
                ? <p>{gear.gearType.firstOptionName}: {gear.firstOptionNotes}</p>
                : null
            }
            {gear.gearType.secondOptionName
                ? <p>{gear.gearType.secondOptionName}: {gear.secondOptionNotes}</p>
                : null
            }
            {gear.accessories.length !== 0
                ? <>
                    <p><strong>Included With This Rental</strong></p>
                    {gear.accessories.map(accessory => 
                        <p key={accessory.id}>{accessory.name}: {accessory.description}</p>
                    )}
                </>
                : null
            }
        </Col>
    )
}