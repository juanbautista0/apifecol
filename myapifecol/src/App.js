import logo from "./myapifecol.png";
import "./App.css";
import "bootstrap/dist/css/bootstrap.min.css";
import {
  Link,
  Route,
  BrowserRouter as Router,
  Switch,
  Redirect,
} from "react-router-dom";
import PrivateRoute from "./components/PrivateRoute";
import PublicRoute from "./components/PublicRoute";

import Dashboard from "./components/Dashboard";
import Login from "./components/Login";
import NoMatch from "./components/NoMatch";

function App() {
  return (
    <Router>
      <Switch>
        <PublicRoute restricted={true} component={Login} path="/" exact />
        <PrivateRoute component={Login} path="/login" exact />
        <PrivateRoute component={Dashboard} path="/dashboard" exact />
        <PrivateRoute component={NoMatch} path="*" />
      </Switch>
    </Router>
  );
}

export default App;
