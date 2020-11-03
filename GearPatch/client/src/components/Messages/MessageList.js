import React, { useContext, useEffect } from "react";
import { MessageContext } from "../../providers/MessageProvider";
import ConversationSummary from "./ConversationSummary";
import { Row, Col, CardDeck } from "reactstrap";

export default function() {

    const { conversations, getConversations } = useContext(MessageContext);

    useEffect(() => {
        getConversations();
        // eslint-disable-next-line
    }, [])

    return (
        <>
            <Row className="my-4">
                <Col xs={12}>
                    <h1 className="text-center">Messages</h1>
                </Col>
            </Row>
            <CardDeck>
                {conversations.map(conversation => 
                    <ConversationSummary key={conversation.lastMessage.id} conversation={conversation} />
                )}
            </CardDeck>
        </>
    )
}