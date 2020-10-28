import React, { useContext } from "react";
import { MessageContext } from "../../providers/MessageProvider";
import { Row, Col } from "reactstrap";

export default function({ message, currentUserId }) {

    const { getMessages, getUnread, sendRead } = useContext(MessageContext);

    const markRead = () => {
        sendRead(message.id)
        .then(() => getMessages(message.senderId))
        .then(() => getUnread());
    }

    return (
        <>
        {message.senderId === currentUserId
            ? <Row className="border-dark justify-content-end mx-4">
        <Col md={6} onClick={markRead} className="border border-dark mx-4">
            {(message.unread && message.recipientId === currentUserId)
                ? <strong>{message.content}</strong>
                : message.content
            }
            <p><em>Sent {message.createDateTime.replace("T", " ")}</em></p>
        </Col>
                <Col md={2} className="text-center">
                    <img src={message.sender.imageLocation} alt="You" className="rounded-circle" />
                    <p><strong>You</strong></p>
                </Col>
            </Row>
            : <Row className="border-dark justify-content-start mx-4">
                <Col md={2} className="text-center">
                    <img src={message.sender.imageLocation} alt={message.sender.fullName} className="rounded-circle" />
                    <p><strong>{message.sender.fullName}</strong></p>
                </Col>
                <Col md={6} onClick={markRead} className="border border-dark mx-4">
                    {(message.unread && message.recipientId === currentUserId)
                        ? <>
                            <p><strong>{message.content}</strong></p>
                            <p><strong><em>Click to mark "read"</em></strong></p>
                            </>
                        : message.content
                    }
                    <p><em>Sent {message.createDateTime.replace("T", " ")}</em></p>
                </Col>
            </Row>
        }
        </>


    )
}