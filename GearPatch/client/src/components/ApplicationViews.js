import React, { useContext } from "react";
import { Switch, Route, Redirect } from "react-router-dom";
import { UserProfileContext } from "../providers/UserProfileProvider";
import { GearProvider } from "../providers/GearProvider";
import Homepage from "./Homepage";
import GearSearchResults from "./Gear/GearSearchResults";
import GearListing from "./Gear/GearListing";
import NewGear from "./Gear/NewGear";
import MyGear from "./Gear/MyGear";
import OwnerGearListing from "./Gear/OwnerGearListing"
import ReservationPanel from "./Reservations/ReservationPanel";
import MessageList from "./Messages/MessageList";
import Conversation from "./Messages/Conversation";

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
                
                <Route path="/gear/mygear">
                    <GearProvider>
                        <MyGear />
                    </GearProvider>
                </Route>
                
                <Route path="/gear/new" exact>
                    <GearProvider>
                        {isLoggedIn ? <NewGear /> : <Redirect to="/" /> }
                    </GearProvider>
                </Route>

                <Route path="/gear/:id" exact>
                    <GearProvider>
                        <GearListing />
                    </GearProvider>
                </Route>

                <Route path="/gear/:id/owner">
                    <GearProvider>
                        {isLoggedIn ? <OwnerGearListing /> : <Redirect to="/" />}
                    </GearProvider>
                </Route>

                <Route path="/reservations">
                    {isLoggedIn ? <ReservationPanel /> : <Redirect to="/" />}                       
                </Route>

                <Route path="/messages" exact>
                    {isLoggedIn ? <MessageList /> : <Redirect to="/" />}
                </Route>

                <Route path="/messages/:userId">
                    {isLoggedIn ? <Conversation /> : <Redirect to="/" />}
                </Route>
            </Switch>
        </main>
    )
}