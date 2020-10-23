import React, { useState, useEffect, createContext } from "react";

export const UserProfileContext = createContext();

export function UserProfileProvider(props) {
    
    const url = "/api/userprofile";

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

    return (
        <UserProfileContext.Provider value={{ isLoggedIn, login, logout, register, getToken }}>
          {isFirebaseReady
            ? props.children
            : <Spinner className="app-spinner dark" />}
        </UserProfileContext.Provider>
    );
}