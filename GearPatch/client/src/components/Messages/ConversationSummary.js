import React from "react";
import { useHistory } from "react-router-dom";
import { Card, CardBody, CardImg, CardTitle, CardText } from "reactstrap";

export default function({ conversation }) {

    const history = useHistory();

    if (!conversation.otherUser.imageLocation) conversation.otherUser.imageLocation = "null-user.jpg"

    // Error check if messages holds data from another page
    if (!conversation.otherUser) {
        return null;
    }

    return (
        <Card onClick={() => history.push(`/messages/${conversation.otherUserId}`)}>
            <CardImg top width="90%" 
                src={`/api/image/user/${conversation.otherUser.imageLocation}`} 
                alt={conversation.otherUser.firstName} />
            <CardBody>
                <CardTitle>{conversation.otherUser.fullName}</CardTitle>
                    <CardText>
                        <em>{conversation.lastMessage.content.length < 50
                        ? `${conversation.lastMessage.content} ...`
                        : `${conversation.lastMessage.content.substr(0, 50)}...`
                        }</em>
                    </CardText>
                    <CardText>{conversation.messageCount } {conversation.messageCount === 1 ? 'Message' : 'Messages'}</CardText>
                    <CardText>{conversation.unreadMessages > 0 ? `${conversation.unreadMessages} Unread` : null}</CardText>
            </CardBody>
        </Card>
    )
}