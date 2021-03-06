import React, { useState, useEffect, createContext } from "react";
import { useHistory } from "react-router-dom";
import * as firebase from "firebase/app";
import "firebase/auth";
import { Spinner } from "reactstrap";

export const UserProfileContext = createContext();

export function UserProfileProvider(props) {
    
    const url = "/api/userprofile";

    const userProfile = sessionStorage.getItem("userProfile");
    const [isLoggedIn, setIsLoggedIn] = useState(userProfile != null);
    const [isFirebaseReady, setIsFirebaseReady] = useState(false);

    const history = useHistory();

    useEffect(() => {
        firebase.auth().onAuthStateChanged((u) => {
            setIsFirebaseReady(true);
        });
    }, []);

    const login = (email, pw) => {
        return firebase.auth().signInWithEmailAndPassword(email, pw)
          .then((signInResponse) => getUserProfile(signInResponse.user.uid))
          .then((userProfile) => {
            sessionStorage.setItem("userProfile", JSON.stringify(userProfile));
            setIsLoggedIn(true);
        });
    };

    const logout = () => {
        return firebase.auth().signOut()
          .then(() => {
            sessionStorage.clear()
            setIsLoggedIn(false);
            history.push("/");
          });
      };
    
      const register = (userProfile, password) => {
        return firebase.auth().createUserWithEmailAndPassword(userProfile.email, password)
          .then((createResponse) => saveUser({ ...userProfile, firebaseId: createResponse.user.uid }))
          .then((savedUserProfile) => {
            sessionStorage.setItem("userProfile", JSON.stringify(savedUserProfile))
            setIsLoggedIn(true);
        });
    };
    
    const getToken = () => firebase.auth().currentUser.getIdToken();

    const getUserProfile = async (firebaseUserId) => {
        const token = await getToken();
        const res = await fetch(`${url}/${firebaseUserId}`, {
            method: "GET",
            headers: {
                Authorization: `Bearer ${token}`
            }
        });
        const data = await res.json();
        return data;
    };

    const saveUser = async (userProfile) => {
        const token = await getToken();
        const res = await fetch(url, {
            method: "POST",
            headers: {
                Authorization: `Bearer ${token}`,
                "Content-Type": "application/json"
            },
            body: JSON.stringify(userProfile)
        });
        const data = await res.json();
        return data;
    };

    const saveEditedUser = async (userProfile) => {
        const token = await getToken();
        // eslint-disable-next-line
        const res = await fetch(`${url}/${userProfile.id}`, {
            method: "PUT",
            headers: {
                Authorization: `Bearer ${token}`,
                "Content-Type": "application/json"
            },
            body: JSON.stringify(userProfile)
        });

        return null;
    }

    const userActivation = async (id) => {
        const token = await getToken();
        // eslint-disable-next-line
        const res = await fetch(`${url}/activate/${id}`, {
            method: "PUT",
            headers: {
                Authorization: `Bearer ${token}`,
                "Content-Type": "application/json"
            }
        });
        
        return null;
    }  

    return (
        <UserProfileContext.Provider value={{ isLoggedIn, login, logout, register, getToken, getUserProfile, saveEditedUser, userActivation }}>
          {isFirebaseReady
            ? props.children
            : <Spinner className="app-spinner dark" />}
        </UserProfileContext.Provider>
    );
}