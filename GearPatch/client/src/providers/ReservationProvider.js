import React, { useState, createContext, useContext } from "react";
import { UserProfileContext } from "./UserProfileProvider";
import { useHistory } from "react-router-dom";

export const ReservationContext = createContext();

export function ReservationProvider(props) {
    const url = "/api/reservation";

    const { getToken } = useContext(UserProfileContext);

    const newReservation = async (reservation) => {
        const token = await getToken();
        const res = await fetch(url, {
            method: "POST",
            headers: {
                Authorization: `Bearer ${token}`,
                "Content-Type": "application/json"
            },
            body: JSON.stringify(reservation)
        });
        const data = await res.json();

        if (res.ok) {
            return data;
        } else {
            throw new Error(res.type);
        }
    }

    const checkAvailability = async (gearId, startDate, endDate) => {
        const token = await getToken();
        const res = await fetch(`${url}/check/?id=${gearId}&start=${startDate}&end=${endDate}`, {
            method: "GET",
            headers: {
                Authorization: `Bearer ${token}`
            }
        });
        const value = await res.json();
        return value;
    }

    return (
        <ReservationContext.Provider value={{ newReservation, checkAvailability }}>
            {props.children}
        </ReservationContext.Provider>
    )
}