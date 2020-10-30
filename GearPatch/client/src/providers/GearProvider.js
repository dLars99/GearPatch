import React, { useState, createContext, useContext } from "react";
import { UserProfileContext } from "./UserProfileProvider";
import { useHistory } from "react-router-dom";

export const GearContext = createContext();

export function GearProvider(props) {
    const url = "/api/gear";

    const { getToken, isLoggedIn } = useContext(UserProfileContext);

    const [gear, setGear] = useState([]);

    const history = useHistory();

    const searchGear = async (query) => {
        const res = await fetch(`${url}/search?q=${query}`);
        const data = await res.json();
        setGear(data);
    }

    const getGearItem = async (id) => {
        let params = {};
        if (isLoggedIn) {
            const token = await getToken();
            params = {
                method: "GET",
                headers: {
                    Authorization: `Bearer ${token}`
                }
            }
        }
        const res = await fetch(`${url}/${id}`, params);

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

    const saveNewGear = async (gear) => {
        const token = await getToken();
        const res = await fetch(url, {
            method: "POST",
            headers: {
                Authorization: `Bearer ${token}`,
                "Content-Type": "application/json"
            },
            body: JSON.stringify(gear)
        });
        const data = await res.json();

        if (res.ok) {
            return data;
        } else {
            alert("An error has occurred. Please try again.");
        }
    }

    const saveEditedGear = async (gear) => {
        const token = await getToken();
        const res = await fetch(`url/${gear.id}`, {
            method: "PUT",
            headers: {
                Authorization: `Bearer ${token}`,
                "Content-Type": "application/json"
            },
            body: JSON.stringify(gear)
        });
        const data = await res.json();

        if (res.ok) {
            return data;
        } else {
            alert("An error has occurred. Please try again.");
        }
    }

    const getGearTypes = async () => {
        const token = await getToken();
        const res = await fetch("/api/geartype", {
            method: "GET",
            headers: {
                Authorization: `Bearer ${token}`
            }
        });
        const data = await res.json();

        return data;
    }

    const getMyGear = async () => {
        const token = await getToken();
        const res = await fetch("/api/gear/mine", {
            method: "GET",
            headers: {
                Authorization: `Bearer ${token}`
            }
        });
        const data = await res.json();

        setGear(data);
    }

    return (
        <GearContext.Provider value={{ gear, searchGear, getGearItem, getMore,
            saveNewGear, getGearTypes, getMyGear, saveEditedGear }}>
            {props.children}
        </GearContext.Provider>
    )
}