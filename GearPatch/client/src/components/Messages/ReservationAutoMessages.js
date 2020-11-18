import { NumberOfDays } from "../Helpers/DateHelper";

export function NewReservationMessage(reservation, gear) {

    const currentUser = JSON.parse(sessionStorage.userProfile);

    const totalPrice = NumberOfDays(reservation.startDate, reservation.endDate) * reservation.agreedPrice;

    const messageText = `${currentUser.fullName} has requested a reservation for ${gear.manufacturer} ${gear.model}.
    Requested checkout date: ${reservation.startDate}
    Requested return date: ${reservation.endDate}
    Estimated total price: $${totalPrice}
    Please look at your Reservations to confirm this reservation.`

    return {
        recipientId: reservation.ownerId, 
        content: messageText
    };
}


export function ConfirmReservationMessage(reservation) {

    const messageText = `${reservation.owner.fullName} has confirmed your reservation for ${reservation.gear.manufacturer} ${reservation.gear.model} from ${reservation.startDate.substr(0, 10)} to ${reservation.endDate.substr(0, 10)}.
    Please contact ${reservation.owner.firstName} with any questions and to make arrangements for pick up and drop off.`

    return {
        recipientId: reservation.customerId,
        content: messageText
    }
}

export function CancelReservationMessage(currentUser, otherUser, reservation) {

    const messageText = `${currentUser.fullName} has CANCELED your reservation for ${reservation.gear.manufacturer} ${reservation.gear.model} from ${reservation.startDate} to ${reservation.endDate}.
    Please contact ${currentUser.fullName} with any questions or to request alternate arrangements.`

    return {
        recipientId: otherUser.id,
        content: messageText
    }
}
