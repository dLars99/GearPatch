import React, { useState, useEffect, useContext } from "react";
import { useParams } from "react-router-dom";
import { GearContext } from "../../providers/GearProvider";

export default function GearSearchResults() {

    const { gear, searchGear } = useContext(GearContext);
    const { query } = useParams();

    useEffect(() => {
        console.log(query)
        searchGear(query);
        // eslint-disable-next-line
    }, [])

    return (
        <section>
            {console.log(gear)}
        </section>
    )
}