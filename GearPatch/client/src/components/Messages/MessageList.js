import React, { useContext, useState, useEffect } from "react";
import { useHistory } from "react-router-dom";
import { MessageContext } from "../../providers/MessageProvider";
import Message from "./Message";
import { Row, Col, CardDeck } from "reactstrap";

export default function() {

    const { messages, getConversations } = useContext(MessageContext);

    const history = useHistory();

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
                {messages.map(m => 
                    <Message key={m.OtherUserId} conversation={m} />
                )}
            </CardDeck>
        </>
    )
}