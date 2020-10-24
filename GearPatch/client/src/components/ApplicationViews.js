import React, { useContext } from "react";
import { Switch, Route, Redirect } from "react-router-dom";
import { UserProfileProvider } from "../providers/UserProfileProvider";
import { GearProvider } from "../providers/GearProvider";
import { Container } from "reactstrap"
import Homepage from "./Homepage";
import GearSearchResults from "./Gear/GearSearchResults";

export default function ApplicationViews() {

    return (
        <main className="container pt-5">
            <Switch>
                <Route path="/" exact>
                    <Homepage />
                </Route>

                <Route path="/gear/search/:query">
                    <GearProvider>
                        <GearSearchResults />
                    </GearProvider>
                </Route>
            </Switch>
        </main>
    )
}