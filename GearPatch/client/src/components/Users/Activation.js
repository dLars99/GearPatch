import React, { useContext } from "react";
import { UserProfileContext } from "../../providers/UserProfileProvider";
import { Modal, ModalHeader, ModalBody, ModalFooter, Button } from "reactstrap";

export default function Activation({ modal, toggle, currentUser, history }) {

    const { userActivation, logout } = useContext(UserProfileContext);

    const activateUser = () => {
        userActivation(currentUser.id).then(() => logout());
    }

    return (
        <Modal isOpen={modal} toggle={toggle} backdrop={true} keyboard={true}>
            {currentUser.isActive
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
                    <p>You will need to log back in for changes to take effect.</p>
                </ModalBody>
                </>
            }
            <ModalFooter>
                <Button color="primary" onClick={activateUser}>Confirm</Button>{' '}
                <Button color="secondary" onClick={toggle}>Cancel</Button>
            </ModalFooter>
        </Modal>
    )
}