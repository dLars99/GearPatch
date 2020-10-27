import React from 'react';
import { BrowserRouter as Router } from "react-router-dom";
import { UserProfileProvider } from './providers/UserProfileProvider';
import { MessageProvider } from './providers/MessageProvider';
import Header from "./components/Header";
import ApplicationViews from "./components/ApplicationViews";

export default function App() {
  return (
    <Router>
      <UserProfileProvider>
        <MessageProvider>
          <Header />
          <ApplicationViews />
        </MessageProvider>
      </UserProfileProvider>
    </Router>
  );
}