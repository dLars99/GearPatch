import React, { useContext, useState, useEffect } from "react";
import { useHistory, useParams } from "react-router-dom";
import { MessageContext } from "../../providers/MessageProvider";
import Message from "./Message";
import { Row, Col } from "reactstrap";

export default function() {

    const { messages, getMessages } = useContext(MessageContext);

    const [otherUser, setOtherUser] = useState();
    
    const { userId } = useParams();
    const history = useHistory();

    const currentUserId = JSON.parse(sessionStorage.userProfile).id;

    useEffect(() => {
        getMessages(userId)
        // eslint-disable-next-line
    }, [])

    useEffect(() => {
        // Extract the other user's information from the array of messages,
        // where the other user could be either the sender or the recipient
        if (messages.length > 0) {
            const otherObject = messages.find(message => message.senderId !== currentUserId || message.recipientId !== currentUserId);
            setOtherUser((otherObject.senderId === currentUserId) ? otherObject.recipient : otherObject.sender);
        }
    }, [messages])

    if (!otherUser) {
        return null;
    }

    return (
        <>
        <Row className="justify-content-center">
            <Col className="text-center mb-4">
                <h1>Your Conversation with {otherUser.firstName} {otherUser.lastName[0]}.</h1>
            </Col>
        </Row>
        {messages.map(message =>
            <Message key={message.id} message={message} currentUserId={currentUserId} />
        )}
        </>
    )
}