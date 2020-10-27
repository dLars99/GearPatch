import React, { useState, createContext, useContext } from "react";
import { UserProfileContext } from "./UserProfileProvider";

export const ReservationContext = createContext();

export function ReservationProvider(props) {
    const url = "/api/reservation";

    const { getToken } = useContext(UserProfileContext);

    const [reservations, setReservations] = useState([]);
    const [unconfirmed, setUnconfirmed] = useState();

    const currentUserId = (sessionStorage.userProfile) ? JSON.parse(sessionStorage.userProfile).id : 0;

    const getByUser = async () => {
        const token = await getToken();
        const res = await fetch(`${url}/user/${currentUserId}`, {
            method: "GET",
            headers: {
                Authorization: `Bearer ${token}`
            }
        });
        const data = await res.json();
        setReservations(data);
    }

    const getUnconfirmed = async () => {
        const token = await getToken();
        const res = await fetch(`${url}/new`, {
            method: "GET",
            headers: {
                Authorization: `Bearer ${token}`
            }
        });
        const data = await res.json();

        setUnconfirmed(data);
    }


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
            throw new Error(res.statusText);
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
        const data = await res.json();
        return data;
    }

    const saveConfirmation = async (id) => {
        const token = await getToken();
        const res = await fetch(`${url}/confirm/${id}`, {
            method: "PUT",
            headers: {
                Authorization: `Bearer ${token}`
            }
        });
        if (!res.ok) alert("An error has occurred. Please try again.");
    }

    return (
        <ReservationContext.Provider value={{ reservations, unconfirmed, getByUser, newReservation, getUnconfirmed, checkAvailability, saveConfirmation }}>
            {props.children}
        </ReservationContext.Provider>
    )
}