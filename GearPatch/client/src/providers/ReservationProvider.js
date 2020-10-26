import React, { useState, createContext, useContext } from "react";
import { UserProfileContext } from "./UserProfileProvider";
import { useHistory } from "react-router-dom";

export const ReservationContext = createContext();

export function ReservationProvider(props) {
    const url = "/api/reservation";

    const { getToken } = useContext(UserProfileContext);

    const history = useHistory();

    const newReservation = async (reservation) => {
        const token = await getToken();
        const res = fetch(url, {
            method: "POST",
            headers: {
                Authorization: `Bearer ${token}`,
                "Content-Type": "application/json"
            },
            body: JSON.stringify(reservation)
        });
        const data = res.json();

        if (res.ok) {
            return data;
        } else {
            throw new Error(res.type);
        }
    }

    return (
        <ReservationContext.Provider value={{ newReservation }}>
            {props.children}
        </ReservationContext.Provider>
    )
}