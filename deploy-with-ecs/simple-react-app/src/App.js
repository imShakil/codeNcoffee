import logo from './logo.svg';
import './App.css';
import React, { useEffect, useState } from 'react';

function App() {
  const [serverIp, setServerIp] = useState('');

  useEffect(() => {
    fetch('https://api.ipify.org?format=json')
      .then((res) => res.json())
      .then((data) => setServerIp(data.ip))
      .catch(() => setServerIp('Unable to fetch IP'));
  }, []);

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Welcome to <code>codeNcoffee</code>!
        </p>
        <p>
          <strong>Server Public IP:</strong> {serverIp}
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
