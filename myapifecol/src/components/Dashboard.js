import React, { Component, createElement } from "react";
import ReactDom from "react-dom";
import Jumbotron from "react-bootstrap/Jumbotron";
import Container from "react-bootstrap/Container";
import Navbar from "react-bootstrap/Navbar";
import NavDropdown from "react-bootstrap/NavDropdown";
import Nav from "react-bootstrap/Nav";
import logo from "../myapifecol.png";
import "../App.css";
import "bootstrap/dist/css/bootstrap.min.css";
import "noty/lib/noty.css";
import "noty/lib/themes/light.css";

import Billers from "./Billers/Billers";
import Resolutions from "./Resolutions";

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
      reload: false

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
  componentDidMount() {
    //Set Main container
  }

  Logaut() {
    localStorage.removeItem("token");
    window.location.reload();
  }
  Home(){
    apifecol.SetTitle("Dashboard");
    ReactDom.render("", apifecol.MainComponent());

  }
  Billers() {
    ReactDom.render(<Billers />, apifecol.MainComponent());
  }

  Resolutions() {
    ReactDom.render(<Resolutions />, apifecol.MainComponent());
  }

  render() {
    return (
      <div>
        <Navbar bg="light" expand="lg">
          <Navbar.Brand href="" onClick={this.Home}>
            <img
              src={logo}
              width="40"
              height="40"
              className="d-inline-block align-top"
              alt="logo"
            />
          </Navbar.Brand>
          <Navbar.Toggle aria-controls="basic-navbar-nav" />
          <Navbar.Collapse id="basic-navbar-nav">
            <Nav className="mr-auto">
              <Nav.Link href="" onClick={this.Billers}>
                Billers
              </Nav.Link>
              <Nav.Link href="" onClick={this.Resolutions}>
                Resolutions
              </Nav.Link>
              <NavDropdown title="Exit" id="basic-nav-dropdown">
                <NavDropdown.Item onClick={this.Logaut} href="">
                  Logaut
                </NavDropdown.Item>
              </NavDropdown>
            </Nav>
          </Navbar.Collapse>
        </Navbar>
        <Jumbotron fluid className="heroBanner">
          <Container fluid>
            <div>
              <h1 id="ComponentTitle">Dashboard</h1>
              <div className="row"></div>
            </div>
          </Container>
        </Jumbotron>
        <Container fluid>
          <div id="component"></div>
        </Container>
      </div>
    );
  }
}

export default Dashboard;
