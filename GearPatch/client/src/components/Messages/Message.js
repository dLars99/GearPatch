import React, { useContext } from "react";
import { MessageContext } from "../../providers/MessageProvider";
import { Row, Col } from "reactstrap";

export default function({ message, currentUserId }) {

    const { getMessages, getUnread, sendRead } = useContext(MessageContext);

    if (!message.sender.imageLocation) message.sender.imageLocation = "null-user.jpg"
    if (!message.recipient.imageLocation) message.recipient.imageLocation = "null-user.jpg"

    const markRead = () => {
        sendRead(message.id)
        .then(() => getMessages(message.senderId))
        .then(() => getUnread());
    }

    return (
        <>
        {message.senderId === currentUserId
            ? <Row className="justify-content-end my-3 mx-4">
                <Col md={7} onClick={markRead} className="rounded border border-dark mx-4 pt-2">
                    {(message.unread && message.recipientId === currentUserId)
                        ? <strong>{message.content}</strong>
                        : <p>{message.content}</p>
                    }
                    <p className="mt-3"><small><em>Sent {message.createDateTime.replace("T", " ").substr(0, 19)}</em></small></p>
                </Col>
                <Col md={2} className="text-center">
                <img width="100%" src={`/api/image/user/${message.sender.imageLocation}`}
                        alt="You" className="rounded-circle" />
                    <p className="my-0"><strong>You</strong></p>
                </Col>
            </Row>
            : <Row className="justify-content-start my-3 mx-4">
                <Col md={2} className="text-center">
                <img width="100%" src={`/api/image/user/${message.sender.imageLocation}`}
                        alt={message.sender.fullName} className="rounded-circle" />
                    <p><strong>{message.sender.fullName}</strong></p>
                </Col>
                <Col md={7} onClick={markRead} className="rounded border border-dark mx-4 pt-2">
                    {(message.unread && message.recipientId === currentUserId)
                        ? <>
                            <p><strong>{message.content}</strong></p>
                            <p><small><strong><em>Click to mark "read"</em></strong></small></p>
                            </>
                        : <p>{message.content}</p>
                    }
                    <p className="mt-3"><small><em>Sent {message.createDateTime.replace("T", " ").substr(0, 19)}</em></small></p>
                </Col>
            </Row>
        }
        </>


    )
}