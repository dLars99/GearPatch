import React, { useEffect, useContext } from "react";
import { useHistory } from "react-router-dom";
import { GearContext } from "../../providers/GearProvider";
import GearSummary from "./GearSummary";
import { Row } from "reactstrap";

export default function MyGear() {

    const { gear, getMyGear } = useContext(GearContext);
    
    const history = useHistory();
    
    useEffect(() => {
        getMyGear();
        // eslint-disable-next-line
    }, [])

    return (
        <>
        <Row className="justify-content-center my-4">
            <h1 className="text-center">My Gear</h1>
        </Row>
        <Row>
            {gear.map(g => 
                <GearSummary key={g.id} gearItem={g} history={history} />
            )}
        </Row>
        </>
    )
}