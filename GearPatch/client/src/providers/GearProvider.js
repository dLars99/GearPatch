import React, { useState, createContext, useContext } from "react";
import { UserProfileContext } from "./UserProfileProvider";
import { useHistory } from "react-router-dom";

export const GearContext = createContext();

export function GearProvider(props) {
    const url = "/api/gear";

    const { getToken } = useContext(UserProfileContext);

    const [gear, setGear] = useState([]);

    const history = useHistory();

    const searchGear = async (query) => {
        const res = await fetch(`${url}/search?q=${query}`);
        const data = await res.json();
        setGear(data);
    }

    const getGearItem = async (id) => {
        const res = await fetch(`${url}/${id}`);
        if (!res.ok) {
            // Reroute to homepage if post does not exist
            history.push("/");
        }
        const data = await res.json();
        return data;
    }

    const getMore = async (userId) => {
        const res = await fetch(`${url}/more/${userId}`);
        const data = await res.json();
        setGear(data);
    }

    return (
        <GearContext.Provider value={{ gear, searchGear, getGearItem, getMore }}>
            {props.children}
        </GearContext.Provider>
    )
}