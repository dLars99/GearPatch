import React from "react";
import { Col } from "reactstrap";

export default function GearDetails({ gear }) {

    return (
        <Col xs={12} md={8}>
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
            {gear.accessories
                ? <>
                <p><strong>Included With This Rental</strong></p>}
                {gear.accessories.map(accessory => 
                    <p key={accessory.id}>{accessory.name}</p>
                )}
                </>
                : null
            }
        </Col>
    )
}