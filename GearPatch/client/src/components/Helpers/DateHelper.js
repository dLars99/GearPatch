/* Name: NumberOfDays
Description: find the number of days between two dates, rounded up
Params: startDate, endDate */
export function NumberOfDays(startDate, endDate) {
    const dayLength = 24 * 60 * 60 * 1000;
    const firstDate = new Date(startDate);
    const secondDate = new Date(endDate);

    const diff = Math.ceil((secondDate - firstDate) / dayLength);
    // The minimum length of any rental is one day
    return (diff > 0) ? diff : 1;
}

export function TodayDate() {
    const todayDate = new Date();
    return `${todayDate.getFullYear()}-${('0' + (todayDate.getMonth() + 1)).slice(-2)}-${('0' +  todayDate.getDate()).slice(-2)}`;
}