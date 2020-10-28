import React, { useContext, useState } from "react";
import { Form, FormGroup, Input, Label, Row, Button } from "reactstrap";
import { MessageContext } from "../../providers/MessageProvider";

export default function({ toggle, recipient }) {

    const { sendMessage, getMessages } = useContext(MessageContext);
    const [replyText, setReplyText] = useState();

    const submitMessage = (evt) => {
        evt.preventDefault();
        const newMessage = {
            recipientId: recipient.id,
            content: replyText
        };
        sendMessage(newMessage)
        .then(() => getMessages(recipient.id))
        .then(() => toggle());
    }

    return (
        <Form>
            <FormGroup>
                <Label for="content">Message to {recipient.fullName}</Label>
                <Input type="textarea" name="content" id="content" placeholder="Enter your message here."
                    onChange={(evt) => setReplyText(evt.target.value)} />
            </FormGroup>
            <Row className="justify-content-between">
                <Button color="primary" onClick={submitMessage}>Send</Button>{' '}
                <Button color="secondary" onClick={toggle}>Cancel</Button>
            </Row>
        </Form>
    )
}