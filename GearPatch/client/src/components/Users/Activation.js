import React, { useContext } from "react";
import { UserProfileContext } from "react-router-dom";
import { Modal, ModalHeader, ModalBody, ModalFooter, Button } from "reactstrap";

export default function Activation({ modal, toggle, userProfile, history }) {

    const { userActivation, logout } = useContext(UserProfileContext);

    const activateUser = () => {
        userActivation(userProfile.id).then(() => {
            // This is the active state of the user prior to the change
            if (userProfile.isActive) {
                logout()
            } else {
                history.push("/")
            }
        });
    }

    return (
        <Modal isOpen={modal} toggle={toggle} backdrop={true} keyboard={true}>
            {userProfile.isActive
            ? <>
                <ModalHeader toggle={toggle}>Deactivate User</ModalHeader>
                <ModalBody>
                    <h4 className="text-center">Do you wish to deactivate your profile?</h4>
                    <p>None of your gear will appear in searches, and other users will not be able to make reservations.</p>
                    <p>You will be immediately logged out, but can log in and reactivate your profile later.</p>
                </ModalBody>
                </>
            : <>
                <ModalHeader toggle={toggle}>Reactivate User</ModalHeader>
                <ModalBody>
                    <h4 className="text-center">Do you wish to reactivate your profile?</h4>
                    <p>This will make any gear that was not previously inactive immediately available for reservations.</p>
                </ModalBody>
                </>
            }
            <ModalFooter>
                <Button color="primary" onClick={activateUser}>Confirm</Button>{' '}
                <Button color="secondary" onClick={toggle}>Cancel</Button>
            </ModalFooter>
        </Modal>
    )
    )
}