import React from 'react';
import { BrowserRouter as Router } from "react-router-dom";
import Header from "./components/Header";
import Homepage from "./components/Homepage";

function App() {
  return (
    <Router>
      <Header />
      <Homepage />
    </Router>
  );
}

export default App;
