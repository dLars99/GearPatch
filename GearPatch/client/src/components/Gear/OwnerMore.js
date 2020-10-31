import React, { useEffect, useContext } from "react";
import { Row, Col } from "reactstrap";
import { GearContext } from "../../providers/GearProvider";
import GearSummary from "./GearSummary";

export default function OwnerMore({ ownerId, history }) {

    const { gear, getMore } = useContext(GearContext);

    useEffect(() => {
        getMore(ownerId);
        // eslint-disable-next-line
    }, [])

    return (
        <Col xs={12} md={8}>
            <h3>More from this owner</h3>
            <Row>
                {gear.map(g =>
                    <GearSummary key={g.id} gearItem={g} history={history} />
                )}
            </Row>
        </Col>
    );
}