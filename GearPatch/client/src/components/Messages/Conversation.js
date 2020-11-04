import React, { useContext, useState, useEffect } from "react";
import { Link, useParams } from "react-router-dom";
import { MessageContext } from "../../providers/MessageProvider";
import Message from "./Message";
import Reply from "./Reply";
import { Row, Col, Button } from "reactstrap";

export default function() {

    const { messages, getMessages } = useContext(MessageContext);

    const [otherUser, setOtherUser] = useState();
    const [reply, setReply] = useState(false);
    
    const { userId } = useParams();

    const currentUserId = JSON.parse(sessionStorage.userProfile).id;

    const toggleReply = () => setReply(!reply);

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
        // eslint-disable-next-line
    }, [messages])

    if (!otherUser) {
        return null;
    }

    return (
        <>
        <Row className="mt-5 ml-3">
            <Link to="/messages">Back to all conversations</Link>
        </Row>

        <Row className="justify-content-center">
            <Col className="text-center mb-4">
                <h1>Your Conversation with {otherUser.fullName}.</h1>
            </Col>
        </Row>
        {messages.map(message =>
            <Message key={message.id} message={message} currentUserId={currentUserId} />
        )}
        <Row className="my-5">
            <Col md={{size: 8, offset: 2}}>
                { reply
                    ? <Reply toggle={toggleReply} recipient={otherUser} />
                    : <Button block color="primary" onClick={toggleReply}>Add Reply</Button>
                }
            </Col>
        </Row>

        </>
    )
}