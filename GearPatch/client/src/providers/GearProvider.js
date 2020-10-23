import React, { useState, createContext, useContext } from "react";

export const GearContext = createContext();

export function GearProvider(props) {
    const url = "/api/gear";

    const { getToken } = useContext(UserProfileContext);

    const [gear, setGear] = useState([]);

    const searchGear = async (query) => {

    }

    return (
        <GearContext.Provider value={{ gear, searchGear }}>
            {props.children}
        </GearContext.Provider>
    )
}