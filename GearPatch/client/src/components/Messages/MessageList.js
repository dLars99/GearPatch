import React, { useContext, useEffect } from "react";
import { MessageContext } from "../../providers/MessageProvider";
import ConversationSummary from "./ConversationSummary";
import { Row, Col, CardDeck } from "reactstrap";

export default function() {

    const { messages, getConversations } = useContext(MessageContext);

    useEffect(() => {
        getConversations();
        // eslint-disable-next-line
    }, [])

    return (
        <>
            <Row>
                <Col xs={12}>
                    <h1>Messages</h1>
                </Col>
            </Row>
            <CardDeck>
                {messages.map(conversation => 
                    <ConversationSummary key={conversation.OtherUserId} conversation={conversation} />
                )}
            </CardDeck>
        </>
    )
}