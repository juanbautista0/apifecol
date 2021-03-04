import React, { Component } from "react";
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
        <Navbar bg="light" expand="lg">
          <Navbar.Brand href="#home">
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
              <Nav.Link href="#home">Home</Nav.Link>
              <Nav.Link href="#link">Link</Nav.Link>
              <NavDropdown title="Dropdown" id="basic-nav-dropdown">
                <NavDropdown.Item href="#action/3.1">Action</NavDropdown.Item>
                <NavDropdown.Item href="#action/3.2">
                  Another action
                </NavDropdown.Item>
                <NavDropdown.Item href="#action/3.3">
                  Something
                </NavDropdown.Item>
                <NavDropdown.Divider />
                <NavDropdown.Item href="#action/3.4">
                  Separated link
                </NavDropdown.Item>
              </NavDropdown>
            </Nav>
          </Navbar.Collapse>
        </Navbar>
        <Jumbotron fluid className="heroBanner">
          <Container fluid>
            <div>
              <h1>Dashboard</h1>
              <div className="row">
                 <div className="col-sm-3"><span className="text-white">Facturadores</span></div>
                 <div className="col-sm-3"><span className="text-white">Documentos</span></div>
                 <div className="col-sm-3"><span className="text-white">Resoluciones</span></div>
              </div>
            </div>
          </Container>
        </Jumbotron>
      </div>
    );
  }
}

export default Dashboard;
