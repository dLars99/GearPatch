import React from "react";
import { Row, Col } from "reactstrap";

export default function({ message, currentUserId }) {

    const markRead = (evt) => {
        alert("Hi!");
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
                        ? <strong>{message.content}</strong>
                        : message.content
                    }
                    <p><em>Sent {message.createDateTime.replace("T", " ")}</em></p>
                </Col>
            </Row>
        }
        </>


    )
}