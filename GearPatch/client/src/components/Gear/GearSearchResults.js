import React, { useEffect, useContext } from "react";
import { useParams, useHistory } from "react-router-dom";
import { GearContext } from "../../providers/GearProvider";
import GearSummary from "./GearSummary";
import { Row } from "reactstrap";

export default function GearSearchResults() {

    const { gear, searchGear } = useContext(GearContext);
    const { query } = useParams();

    const history = useHistory();

    useEffect(() => {
        searchGear(query);
        // eslint-disable-next-line
    }, [])

    return (
        <Row>
            {gear.map(g =>
                <GearSummary key={g.id} gearItem={g} history={history} />)}
        </Row>
    )
}