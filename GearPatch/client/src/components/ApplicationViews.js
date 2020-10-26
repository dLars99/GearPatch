import React, { useContext } from "react";
import { Switch, Route, Redirect } from "react-router-dom";
import { UserProfileProvider } from "../providers/UserProfileProvider";
import { GearProvider } from "../providers/GearProvider";
import Homepage from "./Homepage";
import GearSearchResults from "./Gear/GearSearchResults";
import GearListing from "./Gear/GearListing";
import ReservationPanel from "./Reservations/ReservationPanel";
import { ReservationProvider } from "../providers/ReservationProvider";

export default function ApplicationViews() {

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
                            <GearListing />
                        </ReservationProvider>
                    </GearProvider>
                </Route>

                <Route path="/reservations">
                    <ReservationProvider>
                        <ReservationPanel />
                    </ReservationProvider>
                </Route>
            </Switch>
        </main>
    )
}