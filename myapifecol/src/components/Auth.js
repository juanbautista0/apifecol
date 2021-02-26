import React from "react";
import { Redirect } from "react-router-dom";
import Login from "./Login";
const helpers = require("../Apifecol");

const apifecol = new helpers();
class Auth extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      loggedIn: isLoggedIn(),
    };
  }

  render() {
    const { component: Component, ...rest } = this.props;
    return (
      <Route
        {...rest}
        render={(rProps) =>
          this.state.loggedIn ? (
            <Component {...rProps} />
          ) : (
            <Redirect to={LoginPath} />
          )
        }
      />
    );
  }
}
export default Auth;
