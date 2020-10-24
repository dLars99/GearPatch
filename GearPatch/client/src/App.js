import React from 'react';
import { BrowserRouter as Router } from "react-router-dom";
import { UserProfileProvider } from './providers/UserProfileProvider';
import Header from "./components/Header";
import ApplicationViews from "./components/ApplicationViews";

export default function App() {
  return (
    <Router>
      {/* <UserProfileProvider> */}
        <Header />
        <ApplicationViews />
      {/* </UserProfileProvider> */}
    </Router>
  );
}