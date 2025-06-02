import logo from './logo.svg';
import './App.css';
import React, { useEffect, useState } from 'react';

function App() {

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Welcome to <code>codeNcoffee</code>!
        </p>
        <a
          className="App-link"
          href="https://github.com/imshakil/codeNcoffee"
          target="_blank"
          rel="noopener noreferrer"
        >
          Checkout GitHub Repo
        </a>
      </header>
    </div>
  );
}

export default App;
