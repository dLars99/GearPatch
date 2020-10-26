/* Name: NumberOfDays
Description: find the number of days between two dates, rounded up
Params: startDate, endDate */
export function NumberOfDays(startDate, endDate) {
    const dayLength = 24 * 60 * 60 * 1000;
    const firstDate = new Date(startDate);
    const secondDate = new Date(endDate);

    return Math.ceil(Math.abs((secondDate - firstDate) / dayLength));
}

export function TodayDate() {
    const todayDate = new Date();
    return `${todayDate.getFullYear()}-${todayDate.getMonth() + 1}-${todayDate.getDate()}`;
}