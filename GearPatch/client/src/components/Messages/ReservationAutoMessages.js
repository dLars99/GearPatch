import { NumberOfDays } from "../Helpers/DateHelper";

export function NewReservationMessage(reservation, gear) {

    const currentUser = JSON.parse(sessionStorage.userProfile);

    const totalPrice = NumberOfDays(reservation.startDate, reservation.endDate) * reservation.agreedPrice;

    const messageText = `${currentUser.firstName} ${currentUser.lastName[0]}. has requested a reservation for ${gear.manufacturer} ${gear.model}.
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

    const currentUser = JSON.parse(sessionStorage.userProfile);

    const messageText = `${reservation.owner.firstName} ${reservation.owner.lastName[0]} has confirmed your reservation for ${reservation.gear.manufacturer} ${reservation.gear.model} from ${reservation.startDate} to ${reservation.endDate}.
    Please contact ${reservation.owner.firstName} with any questions and to make arrangements for pick up and drop off.`

    return {
        recipientId: currentUser.id,
        content: messageText
    }
}
