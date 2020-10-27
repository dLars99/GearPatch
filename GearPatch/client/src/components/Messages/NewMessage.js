import React, { useContext, useState } from "react";
import { MessageContext } from "../../providers/MessageProvider";
import { Modal, ModalHeader, ModalBody, ModalFooter, Form, FormGroup, Input, Label, Button } from "reactstrap";

export default function({ modal, toggle, name, item, recipientId }){

    const { sendMessage } = useContext(MessageContext);

    // Set message state with default message
    const [messageContent, setMessageContent] = useState(`I would like to ask a question about your ${item}`);

    const submitMessage = (evt) => {
        evt.preventDefault();
        const newMessage = {
            recipientId: recipientId,
            content: messageContent
        };
        sendMessage(newMessage)
        .then(() => {
            alert("Message sent!")
            toggle();
        })
    }

    return (
        <Modal isOpen={modal} toggle={toggle} backdrop={true} keyboard={true}>
        <ModalHeader toggle={toggle}>Send a Message</ModalHeader>
            <ModalBody>
                <Form>
                    <FormGroup>
                        <Label for="content">Message to {name}</Label>
                        <Input type="textarea" name="content" id="content" 
                            defaultValue={messageContent}
                            onChange={(evt) => setMessageContent(evt.target.value)} />
                    </FormGroup>
                </Form>
            </ModalBody>
            <ModalFooter>
                <Button color="primary" onClick={submitMessage}>Confirm</Button>{' '}
                <Button color="secondary" onClick={toggle}>Cancel</Button>
            </ModalFooter>
        </Modal>
    )
}