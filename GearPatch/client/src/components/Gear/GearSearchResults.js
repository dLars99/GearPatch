import React, { useEffect, useContext } from "react";
import { Link, useParams, useHistory } from "react-router-dom";
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
        <Row className="my-5 py-4">
            {gear.length === 0
            ? <>
                <h2>No results found</h2>
                <Link to="/">Try a different search</Link>
            </>
            : gear.map(g =>
                <GearSummary key={g.id} gearItem={g} history={history} />
            )}
        </Row>
    )
}