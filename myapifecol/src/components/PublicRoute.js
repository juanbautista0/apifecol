import React from "react";
import { Route, Redirect } from "react-router-dom";
const helpers = require("../Apifecol");

const apifecol = new helpers();
function GetServerApiUri() {
  if (localStorage.getItem("server_api") == null) {
    localStorage.setItem("server_api", "");
  }
  return localStorage.getItem("server_api");
}

const isLogin = () => {
  if (localStorage.getItem("token") !== null && GetServerApiUri() !== "") {
    var validate = (response) => {
      return apifecol.IsJson(response);
    };
    var uri = `${GetServerApiUri()}/Login/IsLogged `;
    var success;
    //Send Request
    apifecol.Ajax({
      url: uri,
      type: "POST",
      async: false,
      token: localStorage.getItem("token"),
      success: (data) => {
        if (validate(data)) {
          var result = JSON.parse(data);
          console.log(result);
          switch (result.code) {
            case 202:
              success = true;
              break;
            case 403:
              success = false;
              break;
            default:
              success = false;
              break;
          }
        }
      },
    });
    console.log(success);
    return success;
  }
};
const PublicRoute = ({ component: Component, restricted, ...rest }) => (
  // restricted = false meaning public route
  // restricted = true meaning restricted route
  <Route
    {...rest}
    render={(props) =>
      isLogin() && restricted ? (
        <Redirect to="/login" />
      ) : (
        <Component {...props} />
      )
    }
  />
);

export default PublicRoute;
