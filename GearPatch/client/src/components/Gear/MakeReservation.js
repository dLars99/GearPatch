import React, { useContext, useState, useEffect } from "react";
import { UserProfileContext } from "../../providers/UserProfileProvider";
import { ReservationContext } from "../../providers/ReservationProvider";
import ConfirmReservation from "./ConfirmReservation";
import NewMessage from "../Messages/NewMessage";
import { NumberOfDays, TodayDate } from "../Helpers/DateHelper";
import { Col, Card, CardTitle, CardBody, Form, FormGroup,
    Input, Label, FormFeedback, Row, Button } from "reactstrap";

export default function MakeReservation({ gear }) {

    const { isLoggedIn } = useContext(UserProfileContext);
    const { checkAvailability } = useContext(ReservationContext);

    const [startDate, setStartDate] = useState();
    const [endDate, setEndDate] = useState();
    const [invalid, setInvalid] = useState({startDate: false, endDate: false})
    const [isSending, setIsSending] = useState(false);
    const [confirmModal, setConfirmModal] = useState(false);
    const [messageModal, setMessageModal] = useState(false);
    const [today, setToday] = useState();
    const [total, setTotal] = useState();

    const confirmToggle = () => setConfirmModal(!confirmModal);
    const messageToggle = () => setMessageModal(!messageModal);

    const handleEndDate = (evt) => {
        const selectedEndDate = evt.target.value;
        setEndDate(selectedEndDate);

        let totalDays = NumberOfDays(startDate, selectedEndDate);

        setTotal(totalDays * gear.price);
    }

    const completeReservation = (evt) => {
        evt.preventDefault();
        try {
            
            // Validation
            if (!startDate) {
                setInvalid({...invalid, startDate: true});
                throw new Error("Enter a date to start the rental");
            }
            if (!endDate) {
                setInvalid({...invalid, endDate: true});
                throw new Error("Enter a date to return the rented item");
            }
            if (!isLoggedIn) {
                throw new Error("Please Sign Up or Sign In before making a reservation");
            }
            checkAvailability(gear.id, startDate, endDate).then((available) => {
                if (available) {                    
                    // Reservation is completed from within modal component
                    confirmToggle();
                } else {
                    alert("This item is unavailable for your selected dates.");
                }
            });
        } catch(err) {
            alert(err);
        }
    }

    useEffect(() => {
        setToday(TodayDate());
        setStartDate(TodayDate());
        // eslint-disable-next-line
    }, [])

    const sendMessage = (evt) => {
        try {
            if (!isLoggedIn) {
                throw new Error("Please Sign Up or Sign In to send a message.");
            }
            messageToggle();
        }
        catch(err) {
            alert(err)
        }
    }

    return (
        <Col xs={12} md={4}>
            <Card>
                <CardTitle className="text-center mt-4">
                    <h3>${gear.price} / day</h3>
                </CardTitle>
                <CardBody>
                    <Form>
                        <FormGroup>
                            <Input invalid={invalid.startDate} min={today} defaultValue={today} type="date" name="startDate" id="startDate" onChange={(e) => setStartDate(e.target.value)} />
                            <Label for="startDate">Check Out</Label>
                            <FormFeedback>Enter a date to start the rental.</FormFeedback>
                        </FormGroup>
                        <FormGroup>
                            <Input invalid={invalid.endDate} min={startDate} type="date" name="endDate" id="endDate" onChange={handleEndDate}/>
                            <Label for="endDate">Return</Label>
                            <FormFeedback>Enter a date to return the rented item.</FormFeedback>
                        </FormGroup>
                        {total
                        ? <Row className="justify-content-center">
                            <h4>Total Price: ${total}</h4>
                        </Row>
                        : null
                        }
                        <Row className="justify-content-center mb-3">
                            <Button color="primary" disabled={isSending} onClick={completeReservation}>Request Reservation</Button>
                        </Row>
                        <Row className="justify-content-center">
                            <Button color="primary" onClick={sendMessage}>Ask a Question</Button>
                        </Row>
                    </Form>
                </CardBody>
            </Card>
            <ConfirmReservation modal={confirmModal} toggle={confirmToggle} startDate={startDate} endDate={endDate} total={total} gear={gear} setIsSending={setIsSending} />
            <NewMessage modal={messageModal} toggle={messageToggle} 
                name={`${gear.userProfile.firstName} ${gear.userProfile.lastName[0]}.`}
                item={`${gear.manufacturer} ${gear.model}`} recipientId={gear.userProfileId}
            />
        </Col>
    )
}