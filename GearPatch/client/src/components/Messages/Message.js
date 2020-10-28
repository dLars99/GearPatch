import React from "react";
import { Card, CardBody, CardImg, CardTitle, CardText } from "reactstrap";

export default function({ conversation, side }) {

    return (
        <Card>
            <CardImg top width="90%" src={conversation.otherUser.imageLocation} alt={conversation.otherUser.firstName} />
            <CardBody>
                <CardTitle>{conversation.otherUser.firstName} {conversation.otherUser.lastName[0]}.</CardTitle>
                    <CardText>{conversation.messageCount } {conversation.messageCount === 1 ? 'Message' : 'Messages'}</CardText>
                    <CardText>{conversation.unreadMessages > 0 ? `${conversation.unreadMessages} Unread` : null}</CardText>
            </CardBody>
        </Card>
    )
}