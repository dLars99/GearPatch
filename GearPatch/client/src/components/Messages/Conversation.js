import React, { useContext, useState, useEffect } from "react";
import { useHistory, useParams } from "react-router-dom";
import { MessageContext } from "../../providers/MessageProvider";
import { Row, Col } from "reactstrap";

export default function() {

    const { messages, getMessages } = useContext(MessageContext);

    const [otherUser, setOtherUser] = useState();
    
    const { userId } = useParams();
    const history = useHistory();

    const currentUser = JSON.parse(sessionStorage.userProfile).id;

    useEffect(() => {
        getMessages(userId)
        // eslint-disable-next-line
    }, [])

    useEffect(() => {
        // Extract the other user's information from the array of messages,
        // where the other user could be either the sender or the recipient
        const otherObject = messages.find(message => message.senderId !== currentUser || message.recipientId !== currentUser);
        console.log("otherObject", otherObject)
        setOtherUser((otherObject.senderId === currentUser) ? otherObject.recipient : otherObject.sender);
    }, [messages])

    if (!otherUser) {
        return null;
    }

    return (
        <Row>
            <Col>
                {console.log("Messages:", messages, "OtherUser:", otherUser)}
                <h1>Your Conversation with {otherUser.firstName} {otherUser.lastName[0]}.</h1>
            </Col>
        </Row>
    )
}