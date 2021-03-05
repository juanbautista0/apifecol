import React, { Component } from "react";
import { Grid, html } from "gridjs";
import "gridjs/dist/theme/mermaid.css";

const helpers = require("../Apifecol");

const apifecol = new helpers();

class Billers extends Component {
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
  componentDidMount() {}

  render() {
    return (
      <div>
        <h1>Billers</h1>
        <div id="Billers"></div>
      </div>
    );
  }
}

export default Billers;
