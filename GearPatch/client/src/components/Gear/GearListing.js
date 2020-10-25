import React, { useEffect, useState, useContext } from "react"
import { GearContext } from "../../providers/GearProvider";

export default function GearList({ id }) {

    const [gear, setGear] = useState();

    const { getGearItem } = useContext(GearContext);

    useEffect(() => {
        getGearItem(id).then(setGear);
        // eslint-disable-next-line
    }, [])

    return (
        <>
        {console.log("Hi!")}
        </>
    )
}