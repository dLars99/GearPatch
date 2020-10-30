import React, { useState, useEffect } from "react";
import { history, useHistory } from "react-router-dom";

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
        {editing
            ? <EditUser history={history} id={currentUser.id} />
            : <UserDetails currentUser={currentUser} history={history} />
        }
        </>
    )

}