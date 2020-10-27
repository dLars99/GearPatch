import React, { useState, createContext, useContext } from "react";
import { UserProfileContext } from "./UserProfileProvider";

export const ReservationContext = createContext();

export function ReservationProvider(props) {
    // The API uses "UserMessage" due to "Message" being an existing class in C#.
    // Here, we use "message" for simplicity.
    const url = "/api/usermessage";

    const { getToken } = useContext(UserProfileContext);

    const [messages, setMessages] = useState([]);

    const currentUserId = JSON.parse(sessionStorage.userProfile).id;

    const sendMessage = async (message) => {
        const token = await getToken();
        const res = await fetch(url, {
            method: "POST",
            headers: {
                Authorization: `Bearer ${token}`,
                "Content-Type": "application/json"
            },
            body: JSON.stringify(message)
        });
        const data = await res.json();

        if (res.ok) {
            return data;
        } else {
            throw new Error(res.statusText);
        }
    }

    return (
        <ReservationContext.Provider value={{ messages, sendMessage }}>
            {props.children}
        </ReservationContext.Provider>
    )
}