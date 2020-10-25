import React, { useState, createContext, useContext } from "react";
import { UserProfileContext } from "./UserProfileProvider";

export const GearContext = createContext();

export function GearProvider(props) {
    const url = "/api/gear";

    // const { getToken } = useContext(UserProfileContext);

    const [gear, setGear] = useState([]);

    const searchGear = async (query) => {
        // const token = await getToken();
        const res = await fetch(`${url}/search?q=${query}`, {
            method: "GET",
            headers: {
                // Authorization: `Bearer ${token}`
            }
        });
        const data = await res.json();
        setGear(data);
    }

    const getGearItem = async (id) => {
        // const token = await getToken();
        const res = await fetch(`${url}/gear/${id}`, {
            method: "GET",
            headers: {
                // Authorization: `Bearer ${token}`
            }
        });
        const data = await res.json();
        return data;
    }

    return (
        <GearContext.Provider value={{ gear, searchGear, getGearItem }}>
            {props.children}
        </GearContext.Provider>
    )
}