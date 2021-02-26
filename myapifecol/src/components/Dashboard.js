import React, { Component } from "react";
import logo from "../myapifecol.png";


const helpers = require("../Apifecol");

const apifecol = new helpers();

class Dashboard extends Component {
  constructor(props) {
    super(props);
    this.state = {
      error: null,
      isLoaded: false,
      items: [],
      user: {},
      themes: {},
      themeSelected: "",
    };
    this.user = {
      id: null,
      name: null,
      email: null,
      user_picture: null,
      instance: null,
      language: null,
    };
  }
  state = {
    checked: false,
    theme: false,
  };

  render() {
      return (
          <div>
              <h1>Dashboard Component</h1>
          </div>
      );
  }
}

export default Dashboard;
