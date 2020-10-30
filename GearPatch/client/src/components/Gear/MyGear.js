import React, { useEffect, useContext } from "react";
import { GearContext } from "../../providers/GearProvider";
import GearSummary from "./GearSummary";
import { Row } from "reactstrap";

export default function MyGear() {

    const { gear, getMyGear } = useContext(GearContext);

    useEffect(() => {
        getMyGear();
        // eslint-disable-next-line
    }, [])

    return (
        <>
        <Row>
            <h1>My Gear</h1>
        </Row>
        <Row>
            {gear.map(g => 
                <GearSummary key={g.id} gearItem={g} />
            )}
        </Row>
        </>
    )
}