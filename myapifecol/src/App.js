import logo from './myapifecol.png';
import './App.css';
import 'bootstrap/dist/css/bootstrap.min.css';


function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p className="text-code">
        <strong className="App-link">{`{`}</strong>Apifecol<strong className="App-link">{`}`}</strong>
        </p>
      </header>
    </div>
  );
}

export default App;
