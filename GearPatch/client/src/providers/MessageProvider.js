import React, { useState, createContext, useContext } from "react";
import { UserProfileContext } from "./UserProfileProvider";

export const MessageContext = createContext();

export function MessageProvider(props) {
    // The API uses "UserMessage" due to "Message" being an existing class in C#.
    // Here, we use "message" for simplicity.
    const url = "/api/usermessage";

    const { getToken } = useContext(UserProfileContext);

    const [conversations, setConversations] = useState([]);
    const [messages, setMessages] = useState([]);
    const [unread, setUnread] = useState();

    const currentUserId = sessionStorage.userProfile ? JSON.parse(sessionStorage.userProfile).id : 0;

    const getConversations = async () => {
        const token = await getToken();
        const res = await fetch(`${url}/conversation`, {
            method: "GET",
            headers: {
                Authorization: `Bearer ${token}`
            }
        });
        const data = await res.json();

        setConversations(data);
    }

    const getMessages = async (otherUserId) => {
        const token = await getToken();
        const res = await fetch(`${url}/user/${otherUserId}`, {
            method: "GET",
            headers: {
                Authorization: `Bearer ${token}`
            }
        });
        const data = await res.json();

        setMessages(data);
    }

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

    const getUnread = async () => {
        const token = await getToken();
        const res = await fetch(`${url}/new`, {
            method: "GET",
            headers: {
                Authorization: `Bearer ${token}`
            }
        });
        const data = await res.json();

        setUnread(data);
    }

    return (
        <MessageContext.Provider value={{ conversations, messages, unread, getConversations, getMessages, sendMessage, getUnread }}>
            {props.children}
        </MessageContext.Provider>
    )
}