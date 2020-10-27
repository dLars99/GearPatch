import React, { useContext } from "react";
import { Switch, Route, Redirect } from "react-router-dom";
import { UserProfileContext } from "../providers/UserProfileProvider";
import { GearProvider } from "../providers/GearProvider";
import Homepage from "./Homepage";
import GearSearchResults from "./Gear/GearSearchResults";
import GearListing from "./Gear/GearListing";
import ReservationPanel from "./Reservations/ReservationPanel";

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
                        <GearListing />
                    </GearProvider>
                </Route>

                <Route path="/reservations">
                    {isLoggedIn ? <ReservationPanel /> : <Redirect to="/" />}                       
                </Route>
            </Switch>
        </main>
    )
}