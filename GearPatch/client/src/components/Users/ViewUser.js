import React, { useState, useEffect } from "react";
import { useHistory } from "react-router-dom";
import EditUser from "./EditUser";
import UserDetails from "./UserDetails";

export default function ViewUser() {

    const [currentUser, setCurrentUser] = useState({});
    const [editing, setEditing] = useState(false);

    const toggleEdit = () => setEditing(!editing);

    const history = useHistory();
    
    useEffect(() => {
        let loggedInUser = JSON.parse(sessionStorage.userProfile);
        if (!loggedInUser.imageLocation) loggedInUser.imageLocation = "null-user.jpg"

        setCurrentUser(loggedInUser);
    }, [])

    if (!currentUser.id) return null;

    return (
        <>
        {editing
            ? <EditUser toggleEdit={toggleEdit} history={history} currentUser={currentUser} />
            : <UserDetails toggleEdit={toggleEdit} currentUser={currentUser} history={history} />
        }
        </>
    )

}