import React, { useEffect, useContext } from "react";
import { useParams } from "react-router-dom";
import { GearContext } from "../../providers/GearProvider";
import GearSummary from "./GearSummary";
import { CardDeck } from "reactstrap";

export default function GearSearchResults() {

    const { gear, searchGear } = useContext(GearContext);
    const { query } = useParams();

    useEffect(() => {
        searchGear(query);
        // eslint-disable-next-line
    }, [])

    return (
        <CardDeck>
            {gear.map(g => 
            <GearSummary key={g.id} gearItem={g} />)}
        </CardDeck>
    )
}