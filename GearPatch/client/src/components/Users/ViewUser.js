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
        setCurrentUser(JSON.parse(sessionStorage.userProfile));
    }, [])

    return (
        <>
        {console.log(currentUser)}
        {editing
            ? <EditUser toggleEdit={toggleEdit} history={history} currentUser={currentUser} />
            : <UserDetails toggleEdit={toggleEdit} currentUser={currentUser} history={history} />
        }
        </>
    )

}