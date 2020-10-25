import React, { useEffect, useState, useContext } from "react";
import { CardDeck, Col } from "reactstrap";
import { GearContext } from "../../providers/GearProvider";
import GearSummary from "./GearSummary";

export default function OwnerMore({ ownerId }) {

    const { gear, getMore } = useContext(GearContext);

    const [moreGear, setMoreGear] = useState();

    useEffect(() => {
        getMore(ownerId);
        // eslint-disable-next-line
    }, [])

    return (
        <Col xs={12} md={8}>
            <h3>More from this owner</h3>
            <CardDeck>
                {gear.map(g =>
                    <GearSummary key={g.id} gearItem={g} />
                )}
            </CardDeck>
        </Col>
    );
}