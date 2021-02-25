import React, { Component } from "react";
import logo from "../myapifecol.png";
import "../App.css";
import "bootstrap/dist/css/bootstrap.min.css";
import 'noty/lib/noty.css';
import 'noty/lib/themes/light.css';

import Form from "react-bootstrap/Form";
import Noty from "noty";

const helpers = require("../Apifecol");

const apifecol = new helpers();

class Login extends Component {
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
  SpinnerLoad(ex = true){
    if(ex){
      document.getElementById("spinner").classList.add("rotating");
    }else{
      document.getElementById("spinner").classList.remove("rotating");
    }
  }

  handleSubmit(event) {
    var fields = {
      tenancy: null,
      email: null,
      password: null,
      NIT: null,
      rememember_me: false,
      server: null
    };
    event.preventDefault();
    const form = event.target;
    const data = new FormData(form);
    for (let name of data.keys()) {
     
      if(form.elements[name].value !== ""){
        if(name === 'server'){
          localStorage.setItem("server_api", form.elements[name].value);
        }
        fields[name] = form.elements[name].value;
      }else{
        new Noty({
          text: `Empty field: ${name}`,
          type: 'warning',
          layout   : 'bottomCenter',
          theme    : 'light',
          progressBar:true,
          timeout: 3000,
      }).show();
       return true;
      }
    }
    var uri = `${fields.server}/Login/Login`;
    var beforeSend = (ex = true)=>{
      if(ex){
        document.getElementById("spinner").classList.add("rotating");
      }else{
        document.getElementById("spinner").classList.remove("rotating");
      }
    };
    delete fields.server;

    //Send Request
    apifecol.Ajax({
      url: uri,
      type: 'POST',
      data: JSON.stringify(fields),
      async:false,
      BeforeSend: beforeSend,
      success: (data) =>{
         console.log(JSON.parse(data));
         beforeSend(false);
      }
    });
   
  }

  GetServerApiUri()
  {
    if (localStorage.getItem("server_api") == null) {
      localStorage.setItem("server_api", "");
    }
    return localStorage.getItem("server_api");
  }
  render() {
  
    return (
      <div className="container Login-main">
        <div className="text-center">
          <img id="spinner" src={logo} className="App-logo" alt="logo" />
          <h3 className="text-code">
            <strong className="App-link">{`{`}</strong>Apifecol
            <strong className="App-link">{`}`}</strong>
          </h3>
        </div>
        <div className="row">
          <div className="col-sm">
            <Form autoComplete="off" onSubmit={this.handleSubmit}>
              <Form.Group controlId="email">
                <Form.Label>Email</Form.Label>
                <Form.Control
                  type="email"
                  name="email"
                  placeholder="Enter email..."
                  required
                />
                <Form.Text className="text-muted"></Form.Text>
              </Form.Group>
              <Form.Group controlId="tenancy">
                <Form.Label>Tenancy</Form.Label>
                <Form.Control
                  type="text"
                  name="tenancy"
                  placeholder="tenancy..."
                  required
                />
                <Form.Text className="text-muted"></Form.Text>
              </Form.Group>
              <Form.Group controlId="NIT">
                <Form.Label>NIT/CC/VAT</Form.Label>
                <Form.Control
                  type="text"
                  name="NIT"
                  placeholder="NIT..."
                  required
                />
                <Form.Text className="text-muted"></Form.Text>
              </Form.Group>
              <Form.Group controlId="password" autoComplete="off">
                <Form.Label>Password</Form.Label>
                <Form.Control
                  type="password"
                  name="password"
                  placeholder="Password"
                  required
                />
              </Form.Group>
              <Form.Group controlId="server">
                <Form.Label>Server</Form.Label>
                <Form.Control
                  type="url"
                  name="server"
                  placeholder="http://api.server.com:8000"
                  required
                  defaultValue={this.GetServerApiUri()}
                />
                </Form.Group>
              <Form.Group controlId="remember_me">
                <Form.Check
                  className="checkbox"
                  name="remember_me"
                  type="checkbox"
                  label="Remember me"
                />
              </Form.Group>
              <button type="submit" id="btn-login" className="btn App-btn App-btn-primary" >
                Login
              </button>
            </Form>
          </div>
        </div>
        <br></br>
        <br></br>
        <div className="row">
          <div className="col col-sm">
            <div className="text-center">
              <small className="text-muted">Made in 🇨🇴</small>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default Login;
