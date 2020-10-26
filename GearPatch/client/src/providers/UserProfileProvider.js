import React, { useState, useEffect, createContext } from "react";
import * as firebase from "firebase/app";
import "firebase/auth";
import { Spinner } from "reactstrap";

export const UserProfileContext = createContext();

export function UserProfileProvider(props) {
    
    const apiUrl = "/api/userprofile";

    const userProfile = sessionStorage.getItem("userProfile");
    const [isLoggedIn, setIsLoggedIn] = useState(userProfile != null);
    const [isFirebaseReady, setIsFirebaseReady] = useState(false);

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
          });
      };
    
      const register = (userProfile, password) => {
        return firebase.auth().createUserWithEmailAndPassword(userProfile.email, password)
          .then((createResponse) => saveUser({ ...userProfile, firebaseUserId: createResponse.user.uid }))
          .then((savedUserProfile) => {
            sessionStorage.setItem("userProfile", JSON.stringify(savedUserProfile))
            setIsLoggedIn(true);
        });
    };
    
    const getToken = () => firebase.auth().currentUser.getIdToken();

    const getUserProfile = async (firebaseUserId) => {
        const token = await getToken();
        const res = await fetch(`${apiUrl}/${firebaseUserId}`, {
            method: "GET",
            headers: {
                Authorization: `Bearer ${token}`
            }
        });
        const data = await res.json();
        return data;
    };

    const saveUser = (userProfile) => {
        const token = await getToken();
        const res = await fetch(apiUrl, {
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
        

    return (
        <UserProfileContext.Provider value={{ isLoggedIn, login, logout, register, getToken }}>
          {isFirebaseReady
            ? props.children
            : <Spinner className="app-spinner dark" />}
        </UserProfileContext.Provider>
    );
}