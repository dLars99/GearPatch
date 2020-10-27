import React, { useContext } from "react";
import { Switch, Route, Redirect } from "react-router-dom";
import { UserProfileContext } from "../providers/UserProfileProvider";
import { GearProvider } from "../providers/GearProvider";
import Homepage from "./Homepage";
import GearSearchResults from "./Gear/GearSearchResults";
import GearListing from "./Gear/GearListing";
import ReservationPanel from "./Reservations/ReservationPanel";
import { ReservationProvider } from "../providers/ReservationProvider";
import { MessageProvider } from "../providers/MessageProvider";

export default function ApplicationViews() {

    const { isLoggedIn } = useContext(UserProfileContext);

    return (
        <main className="container-fluid pt-5">
            <Switch>
                <Route path="/" exact>
                    <Homepage />
                </Route>

                <Route path="/gear/search/:query">
                    <GearProvider>
                        <GearSearchResults />
                    </GearProvider>
                </Route>

                <Route path="/gear/:id">
                    <GearProvider>
                        <ReservationProvider>
                            <MessageProvider>
                                <GearListing />
                            </MessageProvider>
                        </ReservationProvider>
                    </GearProvider>
                </Route>

                <Route path="/reservations">
                    <ReservationProvider>
                        <MessageProvider>
                            {isLoggedIn ? <ReservationPanel /> : <Redirect to="/" />}                       
                        </MessageProvider>
                    </ReservationProvider>
                </Route>
            </Switch>
        </main>
    )
}